# 🔬 Research Laboratory

**A Multi-Agent Research System for Claude Code**

Transform your research process with an intelligent laboratory that deploys specialized AI agents to conduct comprehensive research and generate interconnected Obsidian vaults for visual knowledge mapping.

## 🎯 What It Does

The Research Laboratory creates a sophisticated research ecosystem where:
- **Manager Agent** orchestrates the entire research process
- **Specialized Research Agents** (Legal, Policy, Impact, Historical) conduct targeted research
- **Audit Agents** ensure quality and identify cross-connections
- **Obsidian Vault** is automatically generated with visual mind-mapping capabilities

Perfect for complex research projects like analyzing policy impacts, building legal arguments, or creating comprehensive video content with solid source backing.

## 🚀 Quick Start

### 1. Installation
```bash
# Download and run the setup script
curl -O https://github.com/imdoingsomething/research_laboratory/setup.sh
chmod +x setup.sh
./setup.sh
```

### 2. Generate Your Configuration
```bash
cd research-laboratory
npm run config
```

### 3. Run Your Research
```bash
npm start your-config.yaml
```

### 4. Open in Obsidian
- Open the generated vault in Obsidian
- Enable graph view to see your visual mind-map
- Click any talking point to see connected sources

## 🏗️ Architecture

```
Research Laboratory
├── Manager Agent (Orchestrator)
│   ├── Creates Obsidian vault structure
│   ├── Deploys specialized agents
│   └── Monitors progress & quality
├── Research Agents (Specialists)
│   ├── Legal Agent → Court cases, precedents
│   ├── Policy Agent → Government docs, regulations
│   ├── Impact Agent → Academic studies, community data
│   └── Historical Agent → Precedents, comparisons
└── Audit Agents (Quality Assurance)
    ├── Cross-reference opportunities
    ├── Source credibility verification
    ├── Coverage gap identification
    └── Bias detection
```

## 📁 Output Structure

Your research generates a complete Obsidian vault:

```
Research_Vault/
├── 00_Dashboard/
│   ├── Main_Hub.md           # Central navigation
│   ├── Research_Progress.md  # Live progress tracking
│   └── Quality_Metrics.md    # Quality analytics
├── 01_Talking_Points/
│   ├── Talking_Point_1.md    # Your key arguments
│   └── Talking_Point_2.md    # Auto-linked to sources
├── 02_Sources/
│   ├── Legal/               # Court cases, briefs
│   ├── Policy/              # Government documents
│   ├── Impact/              # Academic studies
│   └── Historical/          # Historical analysis
├── 03_Evidence_Synthesis/
│   └── Auto-generated summaries per topic
├── 04_Visual_Elements/
│   └── Screenshots, diagrams, charts
└── 05_Analytics/
    └── Quality reports, audit findings
```

## ⚙️ Configuration

Create a YAML configuration file defining your research:

```yaml
project:
  name: "My Research Project"
  description: "Comprehensive analysis of [your topic]"

research_parameters:
  main_topic: "Your main research topic"
  talking_points:
    - name: "Key Argument 1"
      priority: "high"
      min_sources: 5
      max_sources: 15
    - name: "Key Argument 2"
      priority: "medium"
      min_sources: 3
      max_sources: 10

quality_thresholds:
  min_credibility_score: 7.0
  source_diversity_requirement: 0.7

output:
  directory: "./research_output"
```

## 🤖 Agent Specializations

### Research Agents

**Legal Agent** 🏛️
- Court cases and legal precedents
- Constitutional analysis
- Legal briefs and opinions
- Regulatory interpretations

**Policy Agent** 📋
- Government documents
- Executive orders and directives
- Policy analysis reports
- Regulatory frameworks

**Impact Agent** 📊
- Academic research studies
- Community impact assessments
- Statistical analyses
- NGO and advocacy reports

**Historical Agent** 📚
- Historical precedents
- Comparative policy analysis
- Timeline development
- Context and background

### Audit Agents

**Quality Auditor** ✅
- Source credibility verification
- Factual accuracy checking
- Bias detection and flagging
- Coverage gap identification

**Cross-Reference Auditor** 🔗
- Inter-source connection mapping
- Multi-talking-point relevance
- Evidence synthesis opportunities
- Argument strength analysis

## 🎬 Perfect for Video Content

The Research Laboratory is ideal for content creators who need:

- **Solid Source Backing**: Every claim backed by credible sources
- **Visual Mind-Mapping**: See argument structure at a glance
- **Quick Reference**: Click any point to see supporting evidence
- **Professional Credibility**: High-quality sources with credibility scores

## 📊 Real-Time Monitoring

Track your research progress with:
- **Live Progress Dashboard**: See completion status
- **Quality Metrics**: Average credibility scores
- **Source Discovery**: Real-time source counting
- **Agent Status**: Individual agent progress

## 🔧 Advanced Features

### Quality Assurance
- Automated credibility scoring
- Source diversity requirements
- Bias detection algorithms
- Cross-reference validation

### Integration Options
- Obsidian vault generation
- Zotero library export
- Citation database creation
- PDF summary generation

### Customization
- Configurable agent specializations
- Adjustable quality thresholds
- Flexible output formats
- Custom research strategies

## 📈 Use Cases

### 🎥 **Video Content Creation**
Research complex topics with visual mind-mapping for video scripts

### 📚 **Academic Research**
Comprehensive literature reviews with automated organization

### ⚖️ **Legal Analysis**
Multi-angle legal research with precedent mapping

### 🏛️ **Policy Analysis**
Cross-sectional policy impact assessment

### 📰 **Investigative Journalism**
Multi-source verification with quality assurance

## 🛠️ Commands

```bash
# Generate configuration interactively
npm run config

# Validate your configuration
npm run validate config.yaml

# Run research laboratory
npm start config.yaml

# Run with example configuration
npm run example

# Show help
npm run help

# Run tests
npm test
```

## 📖 Example Workflow

1. **Define Your Research Topic**
   ```bash
   npm run config
   # Follow prompts to define talking points
   ```

2. **Validate Configuration**
   ```bash
   npm run validate my-research-config.yaml
   ```

3. **Execute Research**
   ```bash
   npm start my-research-config.yaml
   ```

4. **Review Results**
   - Open generated vault in Obsidian
   - Review quality metrics in dashboard
   - Explore graph view for visual connections

5. **Refine and Iterate**
   - Adjust configuration based on findings
   - Re-run with refined parameters
   - Build upon previous research

## 🔍 Quality Metrics

The laboratory tracks:
- **Source Credibility**: Average score across all sources
- **Coverage Completeness**: Percentage of talking points adequately sourced
- **Cross-Reference Density**: Interconnection strength
- **Bias Detection**: Potential bias flags and warnings
- **Execution Efficiency**: Time and resource utilization

## 🎯 Best Practices

### Configuration
- Start with 3-5 focused talking points
- Set realistic source targets (5-15 per point)
- Use descriptive, specific talking point names
- Balance priority levels across arguments

### Quality Control
- Set credibility threshold at 7.0 or higher
- Require diverse source types (0.7+ diversity)
- Review audit findings carefully
- Verify cross-references manually

### Obsidian Optimization
- Enable graph view for visual navigation
- Use tags for advanced filtering
- Create custom CSS for better visualization
- Set up templates for consistent formatting

## 🔄 Integration with Claude Code

When used with Claude Code, the Research Laboratory can:
- **Execute Real Searches**: Access live databases and search engines
- **Process Real Documents**: Analyze actual PDFs, websites, and databases
- **Generate Real Content**: Create authentic source notes and summaries
- **Perform Real Analysis**: Conduct genuine cross-reference analysis

## 🚧 Troubleshooting

### Common Issues

**"Configuration validation failed"**
- Check YAML syntax and indentation
- Ensure all required fields are present
- Verify min_sources ≤ max_sources

**"Permission denied"**
- Check write permissions for output directory
- Ensure Node.js has file system access

**"No sources found"**
- Review talking point specificity
- Check network connectivity
- Verify search parameters

### Performance Tips
- Start with smaller source targets for testing
- Use specific, focused talking points
- Monitor system resources during execution
- Optimize configuration based on results

## 📞 Support

- **Documentation**: `docs/README.md`
- **Examples**: `examples/` directory
- **Help Command**: `npm run help`
- **Issues**: Report on GitHub repository

## 🤝 Contributing

The Research Laboratory is designed for extension and customization:
- Add new agent specializations
- Create custom audit algorithms
- Develop integration plugins
- Enhance output formats

## 📄 License

MIT License - See LICENSE file for details

---

**Transform your research process. Deploy your laboratory today.** 🚀
