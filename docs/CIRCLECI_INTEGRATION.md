# CircleCI Integration Guide

## Understanding CI/CD with CircleCI

### What Happens When You Use CircleCI

1. **Code Push**: You push code to your git repository
2. **Trigger**: CircleCI detects the push and starts a "build"
3. **Environment**: CircleCI spins up a clean Linux container
4. **Install**: Your configuration installs LLVM tools
5. **Test**: All your tests run automatically
6. **Report**: Results are processed and displayed
7. **Notify**: You get notifications about success/failure

### Why This Matters

**Before CI:**
```
You: "It works on my machine!" 🤷‍♂️
Colleague: "But it doesn't work on mine..." 😞
```

**With CI:**
```
CircleCI: "Tests passed on a clean Ubuntu environment ✅"
Everyone: "Great! We know it works reliably" 😊
```

## Your CircleCI Configuration Explained

### File Structure
```
.circleci/
└── config.yml  ← This tells CircleCI what to do
```

### Key Components

#### 1. **Commands** (Reusable Steps)
```yaml
commands:
  install-llvm:
    description: "Install LLVM tools and dependencies"
    parameters:
      llvm-version:
        type: string
        default: "20"
```
**Purpose**: Define reusable installation steps for different LLVM versions

#### 2. **Jobs** (What Gets Executed)
```yaml
jobs:
  test-basic:
    docker:
      - image: cimg/base:stable  # Ubuntu-based container
    steps:
      - checkout  # Download your code
      - install-llvm  # Install tools
      - run-tests  # Run tests
```

#### 3. **Workflows** (When Jobs Run)
```yaml
workflows:
  test-and-build:
    jobs:
      - test-basic  # Runs on every commit
      - test-comprehensive:  # Only runs on main branch
          filters:
            branches:
              only: [main, master]
```

## What Each Job Does

### 1. `test-basic` (Runs on Every Commit)
- **Purpose**: Quick feedback on every change
- **Time**: ~2-3 minutes
- **Resources**: Standard container
- **Tests**: All your tests with XML reporting

### 2. `test-comprehensive` (Runs on Main Branch)
- **Purpose**: Detailed analysis and metrics
- **Time**: ~5-10 minutes  
- **Resources**: Larger container (`medium+`)
- **Extra Features**:
  - Performance timing analysis
  - Exercise completion tracking
  - Detailed artifacts

### 3. `test-llvm-versions` (Compatibility Testing)
- **Purpose**: Ensure compatibility across LLVM versions
- **Runs**: In parallel for versions 16, 18, 20
- **Matrix Jobs**: Creates separate jobs for each version

### 4. `nightly` Workflow
- **Purpose**: Long-term monitoring and comprehensive testing
- **Schedule**: Runs daily at 2 AM UTC
- **Coverage**: Tests against LLVM versions 16-20

## XML Output and Reporting

### What lit Generates
```xml
<testsuites time="0.05">
  <testsuite name="LLVM-Lit-Exploration" tests="6" failures="0">
    <testcase name="hello.ll" time="0.04"/>
    <testcase name="math_addition.ll" time="0.04"/>
    <testcase name="math_complex.ll" time="0.03"/>
  </testsuite>
</testsuites>
```

### What CircleCI Does With This
1. **Parses XML**: Understands test results automatically
2. **Creates Dashboard**: Visual representation of test status
3. **Test Insights**: Shows which tests are slow/flaky
4. **Artifacts**: Stores XML files for download
5. **Notifications**: Sends alerts when tests fail

## Setting Up CircleCI for Your Project

### Step 1: Connect Your Repository
1. Go to [circleci.com](https://circleci.com)
2. Sign up with your GitHub/GitLab account
3. Add your `llvm-lit-exploration` project
4. CircleCI will automatically detect `.circleci/config.yml`

### Step 2: First Build
After pushing your code with the config file:
1. CircleCI starts your first build
2. You'll see real-time logs of installation and testing
3. Results appear in the CircleCI dashboard

### Step 3: Understanding the Dashboard
- **Green ✅**: All tests passed
- **Red ❌**: Some tests failed  
- **Yellow 🟡**: Tests are running
- **Gray ⚪**: Tests were skipped/cancelled

## Benefits You Get

### 1. **Immediate Feedback**
```bash
# Instead of manually running:
lit tests/
lit exercises/
lit tests/advanced/

# CircleCI runs everything automatically and tells you:
# "All 18 tests passed ✅"
# "2 exercises still incomplete ⚠️"
# "Performance: Average test time 0.04s"
```

### 2. **Multi-Version Testing**
Your code gets tested against:
- LLVM 16 (older, for compatibility)
- LLVM 18 (LTS version)
- LLVM 20 (latest, what you're using)

### 3. **Progress Tracking**
The comprehensive job tracks your exercise completion:
```
=== Exercise Completion Status ===
Total Exercises: 6
Completed (Passing): 1
Incomplete (Failing): 5
Progress: 1/6 exercises completed
```

### 4. **Performance Monitoring**
Tracks test performance over time:
```
Slowest Tests:
0.04s: hello.ll
0.03s: math_complex.ll
```

## Practical Examples

### When You Push Code
```bash
git add .
git commit -m "Add new optimization test"
git push origin main
```

**CircleCI automatically:**
1. Detects the push
2. Spins up clean environment
3. Installs LLVM 20
4. Runs all tests
5. Reports results in ~3 minutes

### When Tests Fail
CircleCI shows you exactly:
- Which test failed
- The error message
- The full command that was run
- Artifacts (XML files, logs) for debugging

### Exercise Progress Tracking
As you complete exercises, CircleCI tracks your progress:
```
Week 1: 1/6 exercises completed
Week 2: 3/6 exercises completed  
Week 3: 6/6 exercises completed ✅
```

## Cost and Resources

### CircleCI Free Plan
- **Monthly Credits**: 6,000 build minutes/month
- **Parallel Jobs**: Up to 30 jobs
- **Your Usage**: ~3 minutes per build
- **Estimate**: ~2,000 builds per month (very generous!)

### Resource Classes
```yaml
resource_class: small    # 1 CPU, 2GB RAM (default)
resource_class: medium   # 2 CPU, 4GB RAM  
resource_class: medium+  # 3 CPU, 6GB RAM (for comprehensive tests)
```

## Advanced Features You Can Add

### 1. **Slack Notifications**
Get notified when builds fail:
```yaml
- slack/notify:
    event: fail
    template: basic_fail_1
```

### 2. **Deployment After Tests Pass**
```yaml
- deploy:
    requires:
      - test-basic
    filters:
      branches:
        only: main
```

### 3. **Test Parallelization**
Split tests across multiple containers:
```yaml
parallelism: 4
- run: |
    lit $(circleci tests glob "tests/**/*.ll" | circleci tests split)
```

### 4. **Docker Layer Caching**
Speed up builds by caching LLVM installation:
```yaml
setup_remote_docker:
  docker_layer_caching: true
```

## Debugging CI Failures

### 1. **SSH into Build Environment**
CircleCI lets you SSH into failed builds:
```bash
# Click "Rerun job with SSH" in CircleCI dashboard
ssh -p 64536 ubuntu@54.221.135.43
```

### 2. **Local Testing**
Test your CircleCI config locally:
```bash
# Install CircleCI CLI
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/main/install.sh | bash

# Validate config
circleci config validate

# Run locally (requires Docker)
circleci local execute
```

### 3. **Common Issues**
- **LLVM version mismatch**: Different Ubuntu versions have different LLVM packages
- **Missing dependencies**: Some packages aren't in the base image
- **File permissions**: Sometimes artifacts can't be written

## Why This Setup is Powerful

1. **Professional Grade**: Same tools used by major projects
2. **Scalable**: Easy to add more tests, platforms, versions
3. **Reliable**: Clean environment every time
4. **Informative**: Rich reporting and metrics
5. **Educational**: Track your learning progress automatically

This CI setup transforms your project from "works on my machine" to "proven to work reliably" - a crucial step for any serious software development!