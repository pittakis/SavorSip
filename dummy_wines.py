import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import random

# Use the application default credentials
cred = credentials.Certificate('./savorsip-8c64d-firebase-adminsdk-8u3px-326f1b15a8.json')  # Replace with your service account key
firebase_admin.initialize_app(cred)

db = firestore.client()

def create_wine(wid, wine_name, wine_type, wine_description, wine_pic):
    # Generate random data for wine
    numOfRatings = random.randint(1, 100)
    wineRating = round(random.uniform(1, 5), 1)  # Random rating between 1 and 5

    # Add wine data to Firestore
    wines_ref = db.collection(u'Wines')
    wine_doc = wines_ref.document(wid)
    
    wine_data = {
        u'wid': wid,
        u'wineName': wine_name,
        u'wineType': wine_type,
        u'numOfRatings': numOfRatings,
        u'wineRating': wineRating,
        u'wineDescription': wine_description,
        u'winePic': wine_pic
    }
    wine_doc.set(wine_data)

    print(f"Wine {wid} created successfully.")

# Wine names, types, and descriptions for generating random wines
wine_names = ['Merlot', 'Cabernet Sauvignon', 'Chardonnay', 'Sauvignon Blanc', 'Pinot Noir']
wine_types = ['Red', 'White', 'Rose']
wine_descriptions = ['Fruity and Fresh', 'Dry and Rich', 'Crisp and Aromatic', 'Smooth and Velvety']

# Function to create a random wine
def generate_random_wine_data():
    wine_name = random.choice(wine_names)
    wine_type = random.choice(wine_types)
    wine_description = random.choice(wine_descriptions)
    wine_pic = 'assets/images/wine_default.png'
    return wine_name, wine_type, wine_description, wine_pic

# Function to create wines in a loop
def create_multiple_wines(num_wines):
    for i in range(1, num_wines + 1):
        wid = f'wine{i}'
        wine_name, wine_type, wine_description, wine_pic = generate_random_wine_data()
        create_wine(wid, wine_name, wine_type, wine_description, wine_pic)

# Number of wines to create
num_wines_to_create = 10

# Call the function to create multiple wines
create_multiple_wines(num_wines_to_create)
