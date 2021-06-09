const csv = require("csvtojson");
const fs = require("fs");

let images_processed = [];
let images_data = {};
const labels = [
  "cover_image",
  "hero_left",
  "hero_right",
  "navbar",
  "paragraph",
];

// Convert a csv file with csvtojson
csv()
  .fromFile("./result.csv")
  .then(function (jsonArrayObj) {
    jsonArrayObj.forEach((x) => {
      if (images_processed.includes(x.image)) {
        images_data[x.image].push({
          confidence: x.confidence,
          label: labels[x.label],
        });
      } else {
        images_processed.push(x.image);
        images_data[x.image] = [
          { confidence: x.confidence, label: labels[x.label] },
        ];
      }
    });
  })
  .then(() => {
    fs.writeFileSync("ai_output.json", JSON.stringify(images_data));
    console.log(images_data);
  });
