# routes.py
from flask import Blueprint, render_template, request, redirect, url_for, jsonify
from extensions import db  # ����������� db �� extensions.py
from models import Variety  # ����������� ������ Variety

# ������� Blueprint ��� ���������
main = Blueprint('main', __name__)

# ������� �������� (�������� ������ � ������)
@main.route('/')
def index():
    query = request.args.get('query', '') 

    try:
        latest_varieties = Variety.query.order_by(Variety.id.desc()).limit(5).all()
        results = Variety.query.filter(Variety.name_main.ilike(f'%{query}%')).all() if query else []

        return render_template(
            'index.html', 
            latest_varieties=latest_varieties,
            results=results, 
            query=query
        )
        
    except Exception as e:
        import traceback
        traceback.print_exc()  # �������� ������
        return "500 error", 500

# ���������� ������ �����
@main.route('/add_info', methods=['POST'])
def add_info():
    name = request.form['name']
    type_main = request.form['type']
    code = request.form['code']
    description = request.form['description']
    origin = request.form['origin']
    registration_year = request.form['year']

    # ������� ����� ������ Variety
    new_variety = Variety(
        name_main=name,
        type_main=type_main,
        code=code,
        description=description,
        origin=origin,
        registration_year=registration_year
    )

    # ��������� � ���� ������
    db.session.add(new_variety)
    db.session.commit()

    return redirect('/')

# ��������� ���������� � ����� �� ID
@main.route('/get_variety/<int:variety_id>', methods=['GET'])
def get_variety(variety_id):
    variety = Variety.query.get_or_404(variety_id)
    return jsonify({
        'name_main': variety.name_main,
        'type_main': variety.type_main,
        'code': variety.code,
        'description': variety.description,
        'origin': variety.origin,
        'registration_year': variety.registration_year
    })

# ������� �� �������� "� ���"
@main.route('/about')
def about():
    return render_template('about.html')

# ������� �� �������� "�������"
@main.route('/tables')
def tables():
    all_varieties = Variety.query.order_by(Variety.id).all()
    return render_template('tables.html', varieties=all_varieties)

# ����� ������� ��� ��������������
@main.route('/edit/<int:id>', methods=['GET', 'POST'])
def edit_variety(id):
    variety = Variety.query.get_or_404(id)
    
    if request.method == 'POST':
        try:
            variety.name_main = request.form.get('name')
            variety.type_main = request.form.get('type')
            variety.code = request.form.get('code')
            variety.description = request.form.get('description')
            variety.origin = request.form.get('origin')
            variety.registration_year = request.form.get('year') or None
            
            db.session.commit()
            return redirect(url_for('main.tables'))
            
        except Exception as e:
            db.session.rollback()
            print(f"Error{str(e)}")
            return "Error 500", 500
    
    return render_template('edit_variety.html', variety=variety)

# ������� ��� ��������
@main.route('/delete/<int:id>')
def delete_variety(id):
    variety = Variety.query.get_or_404(id)
    db.session.delete(variety)
    db.session.commit()
    return redirect(url_for('main.tables'))
