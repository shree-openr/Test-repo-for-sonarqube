# My Project

This project is a TypeScript application that includes utility functions, custom types, and infrastructure setup using Terraform. It also integrates with SonarQube for code quality analysis.

## Project Structure

```
my-project
├── src
│   ├── index.ts          # Main entry point of the application
│   ├── utils.ts          # Utility functions
│   └── types
│       └── custom.d.ts   # Custom TypeScript types
├── .github
│   └── workflows
│       └── sonarqube.yml # GitHub Actions workflow for SonarQube analysis
├── terraform
│   └── main.tf           # Terraform configuration for infrastructure
├── package.json           # npm configuration file
├── tsconfig.json         # TypeScript configuration file
└── README.md             # Project documentation
```

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd my-project
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Run the application:**
   ```bash
   npm start
   ```

## Usage

- The main logic of the application can be found in `src/index.ts`.
- Utility functions are available in `src/utils.ts`.
- Custom types are defined in `src/types/custom.d.ts`.

## Infrastructure Setup

To set up the infrastructure using Terraform, navigate to the `terraform` directory and run:

```bash
terraform init
terraform apply
```

## SonarQube Integration

This project includes a GitHub Actions workflow for SonarQube analysis. The workflow is defined in `.github/workflows/sonarqube.yml`. Ensure that you have configured your SonarQube project and set the necessary environment variables in your GitHub repository settings.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.