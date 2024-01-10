import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from firebase_admin import auth
import random

# Use the application default credentials
cred = credentials.Certificate('./savorsip-8c64d-firebase-adminsdk-8u3px-326f1b15a8.json')  # Replace with your service account key
firebase_admin.initialize_app(cred)

db = firestore.client()

def create_user(uid, first_name, last_name, username, email, num_of_ratings, profile_pic, all_user_ids, password):
    # Create user in Firebase Authentication
    try:
        user_record = auth.create_user(
            uid=uid,
            email=email,
            password=password
        )
        print('Successfully created new user:', user_record.uid)
    except Exception as e:
        print('Error creating new user:', e)
        return

    # Add user data to Firestore
    users_ref = db.collection(u'Users')
    user_doc = users_ref.document(uid)
    
    user_data = {
        u'uid': uid,
        u'firstName': first_name,
        u'lastName': last_name,
        u'username': username,
        u'email': email,
        u'numOfRating': num_of_ratings,
        u'profilePic': profile_pic
    }
    user_doc.set(user_data)

    # Add random friends
    num_friends = random.randint(1, 5)  # Random number of friends
    friends_ids = random.sample(all_user_ids, num_friends)
    for friend_id in friends_ids:
        if friend_id != uid:  # Ensure the user is not adding himself as a friend
            user_doc.collection(u'friends').document(friend_id).set({'uid': friend_id})

    print(f"User {uid} created successfully.")



# List of first names and last names for generating random names
first_names = ['John', 'Jane', 'Chris', 'Laura', 'Mike', 'Emma', 'Robert', 'Olivia', 'James', 'Linda']
last_names = ['Doe', 'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Miller', 'Davis', 'Garcia', 'Rodriguez']

# Function to create a random name
def generate_random_name():
    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    return first_name, last_name

# Function to create users in a loop
def create_multiple_users(num_users, user_ids):
    for uid in user_ids:
        first_name, last_name = generate_random_name()
        username = f'{first_name.lower()}{last_name.lower()}{uid}'
        email = f'{username}@example.com'
        password = 'password'  # You should generate a secure password
        num_of_ratings = random.randint(1, 100)
        profile_pic = 'assets/images/profile_pic_default.png'

        create_user(uid, first_name, last_name, username, email, num_of_ratings, profile_pic, user_ids, password)


# Number of users to create
num_users_to_create = 20

# Generate a list of unique user IDs
user_ids_to_create = [f'user{i+1}' for i in range(num_users_to_create)]

# Call the function to create multiple users
create_multiple_users(num_users_to_create, user_ids_to_create)