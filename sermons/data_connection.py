import logging
from typing import Dict, List, Optional

import requests
from django.conf import settings

logger = logging.getLogger(__name__)


class DataConnection:
    def __init__(self, base_url: str = None):
        self.base_url = base_url or getattr(
            settings, "DATABASE_API_URL", "http://localhost:8001"
        )

    def _make_request(self, endpoint: str) -> Optional[Dict]:
        """Make HTTP request to database API"""
        try:
            url = f"{self.base_url}{endpoint}"
            response = requests.get(url, timeout=10)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.RequestException as e:
            logger.error(f"API request failed for {endpoint}: {e}")
            return None

    def get_all_sermons_numbers(self) -> List[int]:
        """Get all Spurgeon Gems sermon numbers"""
        data = self._make_request(f"/sermons/all")
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
                sermons.append(sermon_data)
        return sermons

    def search_sermons(self, query: str) -> List[int]:
        """Search for sermons and return sermon numbers"""
        data = self._make_request(f"/sermons?query={query}")
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
        return self._make_request(f"/sermons/{sermon_number}")

    def get_sermon_full_details(self, sermon_number: int) -> Optional[Dict]:
        """Get full sermon details including content"""
        return self._make_request(f"/sermons/{sermon_number}/details")


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
