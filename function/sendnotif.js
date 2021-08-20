var admin = require("firebase-admin");

var serviceAccount = require("../serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
// this registration token comes from the client FCM SDKs.
var registrationToken = 'eGKiISj9Sye7OyESAgj3VD:APA91bFOVA-kuTdeRRH0SXcRPEyBwbqpG2DbBXaYe7iUEDvVD-k25wkT3qO7X8mRqXiGn5sEjK8dibybypq-Phkal8o9X69BPq0PisX2j34OAKNn1GrDK1Su41AETs2IUsHvy439WO9D';

var message = {
    data : {
        title: 'Message from Raphi',
        body: 'What is up duuuuude ?'
    },
    token: registrationToken
};

// Send a message to the device corresponding to the provided
// registration token.
admin.messaging().send(message)
    .then((response) => {
        // Response is a message ID string.
        console.log('Successfully sent message:', response);
    })
    .catch((error => {
        console.log('Error sending message:', error);
    }));