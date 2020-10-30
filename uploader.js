var admin = require("firebase-admin");

var serviceAccount = require("./hackathon-gc-firebase-adminsdk-bwyiw-e088a14645.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://hackathon-gc.firebaseio.com"
});

const firestore = admin.firestore();
const path = require("path");
const fs = require("fs");
const directoryPath = path.join(__dirname, "files");

const fileToRead = "./files/test.json";

fs.readFile(fileToRead, 'utf8', (err, data) => {
  if(err) {
    console.log(err.message);
} else {
//    console.log(data);
    const obj2 = JSON.parse(data);

for (var i = 0; i < obj2.users.length; i++) {
    var user = obj2.users[i];
     firestore.collection("users")
                   .doc(user.number)
                   .set(user)
                   .then(function(docRef) {
                     console.log("Document written");
                   })
                   .catch(function(error) {
                     console.error("Error adding document: ", error);
                   });
}
////       obj2.result.forEach(function(obj) {
//             firestore
//               .collection("users")
//               .doc("one")
//               .set(obj2)
//               .then(function(docRef) {
//                 console.log("Document written");
//               })
//               .catch(function(error) {
//                 console.error("Error adding document: ", error);
//               });
////           });
}
});

//fs.readdir(directoryPath, function(err, files) {
//  if (err) {
//    return console.log("Unable to scan directory: " + err);
//  }
//
//  files.forEach(function(file) {
//    var lastDotIndex = file.lastIndexOf(".");
//
//    var menu = require("./files/" + file);
//
//    menu.forEach(function(obj) {
//      firestore
//        .collection(file.substring(0, lastDotIndex))
//        .doc(obj.itemID)
//        .set(obj)
//        .then(function(docRef) {
//          console.log("Document written");
//        })
//        .catch(function(error) {
//          console.error("Error adding document: ", error);
//        });
//    });
//  });
//});
