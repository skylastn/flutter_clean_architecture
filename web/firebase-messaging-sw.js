importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: "AIzaSyBUjNCMslgbcRiNdgSqBw0rYyF8h04kaVs",
    authDomain: "skykomik.firebaseapp.com",
    projectId: "skykomik",
    storageBucket: "skykomik.appspot.com",
    messagingSenderId: "925616653905",
    appId: "1:925616653905:web:788949cead2f6141049a70",
    measurementId: "G-TS62D0S5KT"
});
// Necessary to receive background messages:
const messaging = firebase.messaging();
console.log("Firebase Web Init");
// Optional:
messaging.onBackgroundMessage((m) => {
    console.log("onBackgroundMessage", m);
});