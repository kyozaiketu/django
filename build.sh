# #!/user/bin/env bash
# # exit on error
# set -o errexit

# pip install -r requirements.txt
# python manage.py collectstatic --no-input
# python manage.py migrate
# python manage.py superuser 

#!/usr/bin/env bash
# Exit on error
set -o errexit

# Modify this line as needed for your package manager (pip, poetry, etc.)
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate

python manage.py create_superuser 