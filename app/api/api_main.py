import db_models
from db_models import WorkdayDBModel
from db_schemas import WorkdayRequestSchema

from db_database import SessionLocal, engine

import uvicorn
from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

from logging import critical


app = FastAPI()
db_models.Base.metadata.create_all(bind=engine)


def get_db():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()


@app.post("/workday")
def workday_entry(workday_request: WorkdayRequestSchema, db: Session = Depends(get_db)):
    workday_model = WorkdayDBModel()
    workday_model.date = workday_request.date
    workday_model.start_time = workday_request.start_time
    workday_model.end_time = workday_request.end_time

    db.add(workday_model)
    db.commit()

    return "Post succeed", workday_request


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
