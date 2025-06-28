#!/bin/bash

# Research Laboratory Setup Script
# This script sets up the complete research laboratory environment

set -e  # Exit on any error

echo "🔬 Research Laboratory Setup"
echo "============================"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if Node.js is installed
check_nodejs() {
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        print_status "Node.js found: $NODE_VERSION"
    else
        print_error "Node.js not found. Please install Node.js 16+ from https://nodejs.org/"
        exit 1
    fi
}

# Check if Claude Code is available
check_claude_code() {
    if command -v claude-code &> /dev/null; then
        print_status "Claude Code found"
    else
        print_warning "Claude Code not found. This is optional but recommended."
        print_info "Install from: https://github.com/anthropic/claude-code"
    fi
}

# Create project structure
create_project_structure() {
    print_info "Creating project structure..."
    
    # Create main directories
    mkdir -p research-laboratory
    cd research-laboratory
    
    mkdir -p {configs,scripts,templates,docs,examples}
    mkdir -p research_output
    
    print_status "Project structure created"
}

# Initialize package.json
init_package_json() {
    print_info "Initializing package.json..."
    
    cat > package.json << EOF
{
  "name": "research-laboratory",
  "version": "1.0.0",
  "description": "Multi-Agent Research Laboratory for Claude Code",
  "main": "research-laboratory.js",
  "scripts": {
    "start": "node research-laboratory.js",
    "config": "node scripts/config-generator.js",
    "validate": "node scripts/validate-config.js",
    "example": "node research-laboratory.js examples/trump-deportation-config.yaml",
    "help": "node scripts/help.js"
  },
  "keywords": ["research", "ai", "claude", "obsidian", "automation"],
  "author": "Research Laboratory Team",
  "license": "MIT",
  "dependencies": {
    "js-yaml": "^4.1.0",
    "commander": "^9.4.1",
    "chalk": "^4.1.2",
    "inquirer": "^8.2.5",
    "progress": "^2.0.3"
  },
  "devDependencies": {
    "jest": "^29.3.1"
  },
  "engines": {
    "node": ">=16.0.0"
  }
}
EOF
    
    print_status "package.json created"
}

# Install dependencies
install_dependencies() {
    print_info "Installing dependencies..."
    
    if command -v npm &> /dev/null; then
        npm install
        print_status "Dependencies installed"
    else
        print_error "npm not found. Please install Node.js with npm."
        exit 1
    fi
}

# Create example configuration
create_example_config() {
    print_info "Creating example configuration..."
    
    cat > examples/trump-deportation-config.yaml << 'EOF'
# Example Research Configuration: Trump Deportation Policies
project:
  name: "Trump Deportation Research"
  description: "Analysis of civil liberties impacts from deportation policies"

research_parameters:
  main_topic: "Trump deportation policies and civil liberties"
  talking_points:
    - name: "The Allowance of Faceless Justice"
      priority: "high"
      min_sources: 3
      max_sources: 8
    - name: "Due Process Stripped Away"
      priority: "high"
      min_sources: 4
      max_sources: 10
    - name: "Fear Replaces Freedom"
      priority: "medium"
      min_sources: 3
      max_sources: 6

quality_thresholds:
  min_credibility_score: 7.0
  source_diversity_requirement: 0.7

output:
  directory: "./research_output"
EOF
    
    print_status "Example configuration created"
}

# Create helper scripts
create_helper_scripts() {
    print_info "Creating helper scripts..."
    
    # Config generator script
    cat > scripts/config-generator.js << 'EOF'
#!/usr/bin/env node

const inquirer = require('inquirer');
const fs = require('fs').promises;
const yaml = require('js-yaml');

async function generateConfig() {
    console.log('🔧 Research Laboratory Configuration Generator\n');
    
    const answers = await inquirer.prompt([
        {
            type: 'input',
            name: 'projectName',
            message: 'Project name:',
            default: 'My Research Project'
        },
        {
            type: 'input',
            name: 'description',
            message: 'Project description:',
        },
        {
            type: 'input',
            name: 'mainTopic',
            message: 'Main research topic:',
        },
        {
            type: 'input',
            name: 'talkingPoints',
            message: 'Talking points (comma-separated):',
        },
        {
            type: 'confirm',
            name: 'useAdvanced',
            message: 'Include advanced configuration options?',
            default: false
        }
    ]);
    
    const config = {
        project: {
            name: answers.projectName,
            description: answers.description
        },
        research_parameters: {
            main_topic: answers.mainTopic,
            talking_points: answers.talkingPoints.split(',').map(tp => ({
                name: tp.trim(),
                priority: 'medium',
                min_sources: 3,
                max_sources: 8
            }))
        },
        quality_thresholds: {
            min_credibility_score: 7.0,
            source_diversity_requirement: 0.7
        },
        output: {
            directory: './research_output'
        }
    };
    
    const filename = `configs/${answers.projectName.replace(/\s+/g, '-').toLowerCase()}-config.yaml`;
    await fs.writeFile(filename, yaml.dump(config));
    console.log(`✓ Configuration saved to: ${filename}`);
}

generateConfig().catch(console.error);
EOF
    
    # Validation script
    cat > scripts/validate-config.js << 'EOF'
#!/usr/bin/env node

const fs = require('fs').promises;
const yaml = require('js-yaml');
const { validateConfig } = require('../research-laboratory.js');

async function validateConfigFile() {
    const configPath = process.argv[2];
    
    if (!configPath) {
        console.error('Usage: npm run validate <config-file.yaml>');
        process.exit(1);
    }
    
    try {
        const configFile = await fs.readFile(configPath, 'utf8');
        const config = yaml.load(configFile);
        
        validateConfig(config);
        console.log('✓ Configuration is valid!');
        
        // Show summary
        console.log(`\nProject: ${config.project.name}`);
        console.log(`Talking Points: ${config.research_parameters.talking_points.length}`);
        console.log(`Expected Sources: ${config.research_parameters.talking_points.reduce((sum, tp) => sum + tp.max_sources, 0)}`);
        
    } catch (error) {
        console.error('✗ Configuration validation failed:', error.message);
        process.exit(1);
    }
}

validateConfigFile();
EOF
    
    # Help script
    cat > scripts/help.js << 'EOF'
#!/usr/bin/env node

console.log(`
🔬 Research Laboratory Help
==========================

QUICK START:
1. npm run config              # Generate a new configuration
2. npm run validate config.yaml # Validate your configuration  
3. npm start config.yaml       # Run the research laboratory

COMMANDS:
- npm start [config-file]      # Run research with configuration
- npm run config              # Interactive configuration generator
- npm run validate <file>     # Validate configuration file
- npm run example             # Run with example configuration
- npm run help                # Show this help

CONFIGURATION:
Create a YAML configuration file with your research parameters.
See examples/ directory for sample configurations.

STRUCTURE:
- configs/     # Your configuration files
- examples/    # Example configurations  
- research_output/ # Generated research vaults
- scripts/     # Helper utilities

For detailed documentation, see: docs/README.md
`);
EOF
    
    chmod +x scripts/*.js
    print_status "Helper scripts created"
}

# Create documentation
create_documentation() {
    print_info "Creating documentation..."
    
    cat > docs/README.md << 'EOF'
# Research Laboratory Documentation

## Overview

The Research Laboratory is a sophisticated multi-agent system that automates research processes and generates organized Obsidian vaults with interconnected findings.

## Features

- **Multi-Agent Architecture**: Specialized research agents (legal, policy, impact, historical)
- **Quality Assurance**: Automated audit agents ensure research quality
- **Obsidian Integration**: Generates fully-linked knowledge vaults
- **Flexible Configuration**: YAML-based configuration system
- **Progress Tracking**: Real-time monitoring and reporting

## Quick Start

1. **Generate Configuration**:
   ```bash
   npm run config
   ```

2. **Validate Configuration**:
   ```bash
   npm run validate your-config.yaml
   ```

3. **Run Research**:
   ```bash
   npm start your-config.yaml
   ```

## Configuration Format

See `examples/` directory for sample configurations.

Required sections:
- `project`: Basic project information
- `research_parameters`: Research scope and talking points
- `quality_thresholds`: Quality control parameters
- `output`: Output configuration

## Output Structure

The laboratory generates:
- **Obsidian Vault**: Complete knowledge base with interconnected notes
- **Research Report**: Comprehensive analysis and metrics
- **Audit Reports**: Quality assurance findings
- **Progress Logs**: Detailed execution tracking

## Agent Types

### Research Agents
- **Legal**: Court cases, legal briefs, constitutional analysis
- **Policy**: Government documents, policy analysis, regulations
- **Impact**: Academic studies, community impact, statistical analysis
- **Historical**: Historical precedents, comparative analysis

### Audit Agents
- **Cross-Reference**: Identify connections between sources
- **Quality**: Verify source credibility and reliability
- **Completeness**: Ensure adequate coverage
- **Bias**: Detect potential bias in source selection

## Troubleshooting

### Common Issues

1. **"Configuration validation failed"**
   - Check YAML syntax
   - Ensure all required fields are present
   - Validate talking points have min/max sources

2. **"Node.js not found"**
   - Install Node.js 16+ from https://nodejs.org

3. **"Permission denied"**
   - Ensure write permissions for output directory

### Support

For issues and questions:
1. Check this documentation
2. Review example configurations
3. Run `npm run help` for quick reference
EOF
    
    print_status "Documentation created"
}

# Create a simple test
create_test() {
    print_info "Creating test suite..."
    
    cat > tests/basic.test.js << 'EOF'
const { validateConfig } = require('../research-laboratory.js');

describe('Research Laboratory', () => {
    test('validates correct configuration', () => {
        const validConfig = {
            project: {
                name: 'Test Project',
                description: 'Test description'
            },
            research_parameters: {
                main_topic: 'Test topic',
                talking_points: [
                    {
                        name: 'Test Point',
                        min_sources: 1,
                        max_sources: 5
                    }
                ]
            }
        };
        
        expect(() => validateConfig(validConfig)).not.toThrow();
    });
    
    test('rejects invalid configuration', () => {
        const invalidConfig = {
            project: {
                name: 'Test Project'
                // Missing description is OK, but missing research_parameters should fail
            }
        };
        
        expect(() => validateConfig(invalidConfig)).toThrow();
    });
});
EOF
    
    mkdir -p tests
    print_status "Test suite created"
}

# Main setup function
main() {
    echo "Starting Research Laboratory setup..."
    echo ""
    
    check_nodejs
    check_claude_code
    
    create_project_structure
    init_package_json
    install_dependencies
    
    create_example_config
    create_helper_scripts
    create_documentation
    create_test
    
    echo ""
    print_status "Research Laboratory setup complete!"
    echo ""
    print_info "Next steps:"
    echo "  1. cd research-laboratory"
    echo "  2. npm run config          # Generate your configuration"
    echo "  3. npm start config.yaml   # Run your research"
    echo ""
    print_info "For help: npm run help"
    print_info "Example: npm run example"
}

# Run main function
main "$@"
