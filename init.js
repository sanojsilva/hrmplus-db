const readline = require("readline");
const fs = require("fs");
const { exec } = require("child_process");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let database = "hrm_plus";
let pass = "1234";
let port = "5432";
let user = "postgres";

const init = async () => {
  if (fs.existsSync(".env")) {
    console.log(".env file exists...");
    fs.unlinkSync(".env");
    console.log(".env file Removed..\n");
  }

  rl.question(`Enter Database Username [${user}]: `, (n) => {
    if (n) {
      user = n;
    }
    rl.question(`Enter Database Port [${port}]: `, (p) => {
      if (p) {
        port = p;
      }

      rl.question(`Enter Database Password [${pass}]: `, (pw) => {
        if (pw) {
          pass = pw;
        }

        const dbUrl = `DATABASE_URL="postgresql://${user}:${pass}@localhost:${port}/${database}?schema=public"`;
        fs.writeFileSync(".env", dbUrl);
        console.log("\nFile Created Successfully!!!");
        rl.close();
      });
    });
  });
};

init();
// rl.question("Are you sure [Y/N]: ", (answer) => {
//   if (answer === "Y") {
//     console.log("Initializing...\n");
//   } else {
//     console.log("Cancelled\n");
//     rl.close();
//   }
// });

rl.on("close", function () {
  console.log("\nBYE BYE!!!");
  process.exit(0);
});
