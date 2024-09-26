// Import the express module
const express = require('express');
const app = express();

// Set the port number to 3000 (or use an environment variable)
const port = process.env.PORT || 3000;

// Define the route to display environment variables
app.get('/', (req, res) => {
  const environment = process.env.ENVIRONMENT || 'Not Set';
  const customText = process.env.CUSTOM_TEXT || 'Not Set';
  const currentDate = new Date().toLocaleString(); // Get current date and time
  
  // Send the environment variables as a response
  res.send(`
    <h1>Environment Variables</h1>
    <p><strong>ENVIRONMENT:</strong> ${environment}</p>
    <p><strong>CUSTOM_TEXT:</strong> ${customText}</p>
    <p><strong>DATE:</strong> ${currentDate}</p>
  `);
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

