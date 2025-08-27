# Utility functions
def convert_str_to_int(string: str) -> int:
    try:
        return int(string)
    except ValueError:
        return None
