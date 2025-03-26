from extensions import db
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship

class Variety(db.Model):
    __tablename__ = 'varieties'
    
    id = db.Column(db.Integer, primary_key=True)
    name_main = db.Column(db.String(100), nullable=False)
    type_main = db.Column(db.String(50), nullable=False)
    code = db.Column(db.String(50), unique=True)
    description = db.Column(db.Text)
    origin = db.Column(db.String(100))
    registration_year = db.Column(db.Integer)
    
    # Связи
    disease_resistances = db.relationship(
        "DiseaseResistance", 
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    eardensity = db.relationship(
        "EarDensity",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    economic_parameters = db.relationship(
        "EconomicParameters",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    environmental_resistances = db.relationship(
        "EnvironmentalResistance",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    grain_qualities = db.relationship(
        "GrainQuality",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    growing_regions = db.relationship(
        "GrowingRegions",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    growth_parameters = db.relationship(
        "GrowthParameters",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    main_characteristics = db.relationship(
        "MainCharacteristics",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    stem_types = db.relationship(
        "StemType",
        back_populates="variety",
        cascade="all, delete-orphan"
    )
    yields = db.relationship(
        "Yield",
        back_populates="variety",
        cascade="all, delete-orphan"
    )


class Disease(db.Model):
    __tablename__ = 'diseases'
    
    id = db.Column(db.Integer, primary_key=True)
    name_dis = db.Column(db.String(100), nullable=False, unique=True)  # Обратите внимание на имя поля
    
    resistances = db.relationship(
        "DiseaseResistance", 
        back_populates="disease",
        cascade="all, delete-orphan"
    )


class DiseaseResistance(db.Model):
    __tablename__ = 'diseaseresistance'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'))
    disease_id = db.Column(db.Integer, db.ForeignKey('diseases.id'))
    resistance_level = db.Column(db.String(50))
    
    variety = db.relationship("Variety", back_populates="disease_resistances")
    disease = db.relationship("Disease", back_populates="resistances")


# Остальные модели с аналогичными исправлениями:

class EarDensity(db.Model):
    __tablename__ = 'eardensity'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    density = db.Column(db.String(50))
    
    variety = db.relationship("Variety", back_populates="eardensity")


class EconomicParameters(db.Model):
    __tablename__ = 'economicparameters'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    yield_stability = db.Column(db.String(50))
    adaptability = db.Column(db.String(50))
    market_value = db.Column(db.Numeric(10, 2))
    production_cost = db.Column(db.Numeric(10, 2))
    
    variety = db.relationship("Variety", back_populates="economic_parameters")


class EnvironmentalResistance(db.Model):
    __tablename__ = 'environmentalresistance'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    drought_resistance = db.Column(db.String(50))
    rain_resistance = db.Column(db.String(50))
    cold_resistance = db.Column(db.String(50))
    lodging_resistance = db.Column(db.String(50))
    shattering_resistance = db.Column(db.String(50))
    
    variety = db.relationship("Variety", back_populates="environmental_resistances")


class GrainQuality(db.Model):
    __tablename__ = 'grainquality'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    protein_content = db.Column(db.Numeric(5, 2))
    gluten_content = db.Column(db.Numeric(5, 2))
    baking_quality = db.Column(db.String(100))
    
    variety = db.relationship("Variety", back_populates="grain_qualities")


class Region(db.Model):
    __tablename__ = 'regions'
    
    id = db.Column(db.Integer, primary_key=True)
    name_territory = db.Column(db.String(100), nullable=False, unique=True)
    
    growing_regions = db.relationship(
        "GrowingRegions",
        back_populates="region",
        cascade="all, delete-orphan"
    )
    yields = db.relationship(
        "Yield",
        back_populates="region",
        cascade="all, delete-orphan"
    )


class GrowingRegions(db.Model):
    __tablename__ = 'growingregions'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'), nullable=False)
    
    variety = db.relationship("Variety", back_populates="growing_regions")
    region = db.relationship("Region", back_populates="growing_regions")


class GrowthParameters(db.Model):
    __tablename__ = 'growthparameters'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    # ... все остальные поля ...
    
    variety = db.relationship("Variety", back_populates="growth_parameters")


class MainCharacteristics(db.Model):
    __tablename__ = 'maincharacteristics'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    plant_height = db.Column(db.String(50))
    ear_shape = db.Column(db.String(50))
    grain_color = db.Column(db.String(50))
    grain_weight_100 = db.Column(db.Numeric(5, 2))
    
    variety = db.relationship("Variety", back_populates="main_characteristics")


class StemType(db.Model):
    __tablename__ = 'stemtype'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    type_st = db.Column(db.String(50))
    
    variety = db.relationship("Variety", back_populates="stem_types")


class Yield(db.Model):
    __tablename__ = 'yield'
    
    id = db.Column(db.Integer, primary_key=True)
    variety_id = db.Column(db.Integer, db.ForeignKey('varieties.id'), nullable=False)
    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'), nullable=False)
    average_yield = db.Column(db.Numeric(5, 2))
    max_yield = db.Column(db.Numeric(5, 2))
    
    variety = db.relationship("Variety", back_populates="yields")
    region = db.relationship("Region", back_populates="yields")
    years = db.relationship(
        "YieldYears",
        back_populates="yield_obj",
        cascade="all, delete-orphan"
    )


class YieldYears(db.Model):
    __tablename__ = 'yieldyears'
    
    id = db.Column(db.Integer, primary_key=True)
    yield_id = db.Column(db.Integer, db.ForeignKey('yield.id'), nullable=False)
    year_y = db.Column(db.Integer)
    
    yield_obj = db.relationship("Yield", back_populates="years")


