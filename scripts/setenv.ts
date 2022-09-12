const { writeFile } = require('fs');
const { argv } = require('yargs');

require('dotenv').config();

const environment = argv.environment;
const targetPath = `./src/environments/environment.prod.ts`

const environmentFileContent = `
  export const environment = {
    production: true,
    apiUrl: "${process.env.API_URL}",
    loginUrl: "${process.env.LOGIN_URL}",
    hasLogin: "${process.env.HAS_LOGIN}"
  };
`;

console.log(environmentFileContent);

writeFile(targetPath, environmentFileContent, (err) => {
  if (err) console.log(err);
  console.log(`Wrote variables to ${targetPath}`);
});
