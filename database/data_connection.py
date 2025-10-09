import logging
from typing import Dict, List, Optional

from django.conf import settings

from database.database import Database

logger = logging.getLogger(__name__)


class DataConnection:
    def __init__(self, base_url: str = None):
        self.database = Database()

    def get_all_sermons_numbers(self) -> List[int]:
        """Get all Spurgeon Gems sermon numbers"""
        data = {"spurgeon_gems_sermon_numbers": self.database.get_all_sermons_numbers()}
        return data["spurgeon_gems_sermon_numbers"]

    def get_sermons_list_page_number(
        self, page_number: int, page_size: int
    ) -> List[int]:
        """Get all Spurgeon Gems sermon numbers for a given page number"""
        all_sermons = self.get_all_sermons_numbers()
        start_index = (page_number - 1) * page_size
        end_index = start_index + page_size
        sermon_numbers = all_sermons[start_index:end_index]

        sermons = []
        for sermon_number in sermon_numbers:
            sermon_data = self.get_sermon_basic_details(sermon_number)
            if sermon_data:
                # Add pk field for template URL generation
                sermon_data["pk"] = sermon_data.get(
                    "spurgeon_gems_number", sermon_number
                )
                sermons.append(sermon_data)
        return sermons

    def search_sermons(self, query: str) -> List[int]:
        """Search for sermons and return sermon numbers"""
        spurgeon_gems_sermon_numbers = self.database.search_sermons(query)
        data = {"spurgeon_gems_sermon_numbers": [spurgeon_gems_sermon_numbers]}
        if data and "spurgeon_gems_sermon_numbers" in data:
            # Your API returns nested list, flatten it
            return (
                data["spurgeon_gems_sermon_numbers"][0]
                if data["spurgeon_gems_sermon_numbers"]
                else []
            )
        return []

    def get_sermon_basic_details(self, sermon_number: int) -> Optional[Dict]:
        """Get basic sermon details"""
        return self.database.get_sermon_basic_details(sermon_number)

    def get_sermon_full_details(self, sermon_number: int) -> Optional[Dict]:
        """Get full sermon details including content"""
        if sermon_number is None:
            return {"error": "Invalid Spurgeon Gems sermon number"}
        return self.database.get_sermon_full_details(sermon_number)


# Example usage
if __name__ == "__main__":
    data_connection = DataConnection()
    sermon_numbers = data_connection.search_sermons("comforter")
    print(sermon_numbers)
    sermon_number = sermon_numbers[0]
    sermon_data = data_connection.get_sermon_basic_details(sermon_number)
    print(sermon_data)
    sermon_data = data_connection.get_sermon_full_details(sermon_number)
    print(sermon_data)
