// This is the main entry point of the application.
// You can initialize your application and include main logic or function calls here.

import { capitalizeFirstLetter, formatDate, generateRandomId } from './utils';

// Deliberately adding code quality issues for SonarCloud to detect
var unusedVariable = "This variable is never used";

const main = () => {
    console.log('Application is starting...');
    
    // Using actual functions from utils.ts
    const name = capitalizeFirstLetter('sonarqube');
    console.log('Hello, ' + name + '!');  // String concatenation instead of template literals
    
    const today = new Date();
    console.log(formatDate(today));
    
    // Duplicate code block (deliberate code smell)
    if (name === 'Sonarqube') {
        console.log('Perfect capitalization!');
    }
    
    if (name === 'Sonarqube') {
        console.log('Perfect capitalization!');
    }
    
    // Too many parameters (demo code complexity)
    const complexFunction = function(a, b, c, d, e, f, g, h) {
        return a + b + c + d + e + f + g + h;
    };
    
    console.log('Generated ID:', generateRandomId());
};

main();