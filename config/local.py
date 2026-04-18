from config.development import DevelopmentConfig


class LocalConfig(DevelopmentConfig):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://softbakery_app2:SofitiBakerytididi@127.0.0.1/softbakery2?charset=utf8mb4"
