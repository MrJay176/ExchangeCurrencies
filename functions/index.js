const functions = require("firebase-functions");


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const stripe = require('stripe')(functions.config().stripe.testKey);

exports.stripePayment = functions.https.onRequest(async(req,res) =>{


})