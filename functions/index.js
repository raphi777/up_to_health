/* eslint-disable */
//import { notificationData } from "notification";

const notification = require("./notification")
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

for (let i = 0; i <= notification.notificationData.length; i++) {
  exports.scheduledFunction = functions.region("europe-west1")
      .pubsub.schedule("* * * * *")
      .timeZone("Europe/Berlin")
      .onRun((context) => {
        // this registration token comes from the client FCM SDKs.
        const registrationToken = "eGKiISj9Sye7OyESAgj3VD:APA91bFOVA-" +
          "kuTdeRRH0SXcRPEyBwbqpG2DbBXaYe7iUEDvVD-k25wkT3qO7X8mRqX" +
          "iGn5sEjK8dibybypq-Phkal8o9X69BPq0PisX2j34OAKNn1GrDK1Su4" +
          "1AETs2IUsHvy439WO9D";

        const message = {
          data: {
            title: notification.notificationData[1].title,
            body: notification.notificationData[1].body,
          },
          token: registrationToken,
        };

        // Send a message to the device corresponding to the provided
        // registration token.
        admin.messaging().send(message)
            .then((response) => {
            // Response is a message ID string.
              console.log("Successfully sent message:", response);
            })
            .catch(((error) => {
              console.log("Error sending message:", error);
            }));
        return null;
      });
}
