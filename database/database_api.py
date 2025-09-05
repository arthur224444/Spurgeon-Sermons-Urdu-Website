from fastapi import FastAPI

from database.database import Database
from database.utils import convert_str_to_int

app = FastAPI()
database = Database()


@app.get("/")
def root():
    return {
        "message": "Welcome to the Spurgeon Sermons database API",
        "description": "A read-only API providing access to a database of Charles Spurgeon's sermons",
        "version": "1.0",
    }


@app.get("/sermons/all")
def get_all_sermons_numbers():
    return {"spurgeon_gems_sermon_numbers": database.get_all_sermons_numbers()}


@app.get("/sermons")
def search_sermons(query: str):
    spurgeon_gems_sermon_numbers = database.search_sermons(query)
    return {"spurgeon_gems_sermon_numbers": [spurgeon_gems_sermon_numbers]}


@app.get("/sermons/{spurgeon_gems_sermon_number}")
def get_sermon_basic_details(spurgeon_gems_sermon_number: str):
    spurgeon_gems_sermon_number = convert_str_to_int(spurgeon_gems_sermon_number)
    if spurgeon_gems_sermon_number is None:
        return {"error": "Invalid Spurgeon Gems sermon number"}
    return database.get_sermon_basic_details(spurgeon_gems_sermon_number)


@app.get("/sermons/{spurgeon_gems_sermon_number}/details")
def get_sermon_full_details(spurgeon_gems_sermon_number: str):
    spurgeon_gems_sermon_number = convert_str_to_int(spurgeon_gems_sermon_number)
    if spurgeon_gems_sermon_number is None:
        return {"error": "Invalid Spurgeon Gems sermon number"}
    return database.get_sermon_full_details(spurgeon_gems_sermon_number)
