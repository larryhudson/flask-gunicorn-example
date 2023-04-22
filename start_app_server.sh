Reset='\e[0m'
Info='\e[1;34m'
Start='\e[1;32m'
Stop='\e[1;33m'
Link='\e[7m'
ResetLink='\e[27m'

APP_HOST=0.0.0.0
APP_PORT=4400
APP_WORKERS=2

echo -e "${Info}Activate the virtual environment${Reset}"
source venv/bin/activate

echo -e "${Info}Install or update python modules${Reset}"
pip3 install -r requirements.txt

echo -e "${Start}Start application server at ${Link}http://${APP_HOST}:${APP_PORT}${ResetLink} with ${APP_WORKERS} workers${Reset}"
gunicorn -b $APP_HOST:$APP_PORT -w=$APP_WORKERS wsgi:app

echo -e "${Info}Deactivate the virtual environment${Reset}"
deactivate

echo -e "${Stop}Application server stopped${Reset}"