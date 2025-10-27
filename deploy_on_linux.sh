sudo apt update
sudo apt install -y python3 python3-venv python3-pip
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip list
gunicorn django_site.wsgi:application --bind 0.0.0.0:8000