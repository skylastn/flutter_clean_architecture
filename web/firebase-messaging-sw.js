importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: "AIzaSyB9er457ibXp-vTFeCalWvXn9cn7R0vgOs",
    authDomain: "lugu-food-deliv.firebaseapp.com",
    projectId: "lugu-food-deliv",
    storageBucket: "lugu-food-deliv.appspot.com",
    messagingSenderId: "901307950886",
    appId: "1:901307950886:web:a9278b594e8b0241de83e7",
    measurementId: "G-85G2EJ2MHK"
});
// Necessary to receive background messages:
const messaging = firebase.messaging();
console.log("Firebase Web Init");
// Optional:
messaging.onBackgroundMessage((m) => {
    console.log("onBackgroundMessage", m);
});