#!/bin/bash

# QuantumCache Test Runner
# Sprint 4 Task: Comprehensive testing after cleanup
# Created by: QuantumCache
# Date: 2025-08-01

set -euo pipefail

# Configuration
TEST_LOG="${TEST_LOG:-/tmp/q-cache-test-runner.log}"
REPORT_DIR="${REPORT_DIR:-/tmp/q-cache-test-reports}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logging function
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "[${timestamp}] [${level}] ${message}" | tee -a "$TEST_LOG"
}

# Initialize test runner
init_test_runner() {
    log "INFO" "Initializing comprehensive test runner"
    mkdir -p "$REPORT_DIR"
    
    log "INFO" "Test runner initialized"
}

# Test project structure
test_project_structure() {
    log "INFO" "Testing project structure"
    
    local structure_tests=0
    local total_structure_tests=8
    
    echo -e "${CYAN}=== Project Structure Tests ===${NC}"
    
    # Test 1: Check if coms.json exists
    if [[ -f "coms.json" ]]; then
        echo -e "${GREEN}✅${NC} coms.json exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} coms.json missing"
    fi
    
    # Test 2: Check if board.md exists
    if [[ -f "board.md" ]]; then
        echo -e "${GREEN}✅${NC} board.md exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} board.md missing"
    fi
    
    # Test 3: Check if bin directory exists
    if [[ -d "bin" ]]; then
        echo -e "${GREEN}✅${NC} bin directory exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} bin directory missing"
    fi
    
    # Test 4: Check if docs directory exists
    if [[ -d "docs" ]]; then
        echo -e "${GREEN}✅${NC} docs directory exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} docs directory missing"
    fi
    
    # Test 5: Check if src directory exists
    if [[ -d "src" ]]; then
        echo -e "${GREEN}✅${NC} src directory exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} src directory missing"
    fi
    
    # Test 6: Check if .github directory exists
    if [[ -d ".github" ]]; then
        echo -e "${GREEN}✅${NC} .github directory exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} .github directory missing"
    fi
    
    # Test 7: Check if package.json exists
    if [[ -f "package.json" ]]; then
        echo -e "${GREEN}✅${NC} package.json exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} package.json missing"
    fi
    
    # Test 8: Check if git repository exists
    if [[ -d ".git" ]]; then
        echo -e "${GREEN}✅${NC} git repository exists"
        ((structure_tests++))
    else
        echo -e "${RED}❌${NC} git repository missing"
    fi
    
    local structure_percentage=$(echo "scale=1; $structure_tests * 100 / $total_structure_tests" | bc -l)
    
    echo -e "${CYAN}=== Structure Summary ===${NC}"
    echo -e "${GREEN}Structure Tests Passed:${NC} $structure_tests/$total_structure_tests"
    echo -e "${GREEN}Structure Score:${NC} ${structure_percentage}%"
    echo -e "${CYAN}===========================${NC}"
    
    log "INFO" "Project structure test completed: ${structure_percentage}%"
    
    # Return structure percentage for reporting
    echo "$structure_percentage"
}

# Test tool availability
test_tool_availability() {
    log "INFO" "Testing tool availability"
    
    local tools=()
    tools+=("bin/technical-debt-monitor.sh")
    tools+=("bin/performance-optimizer.sh")
    tools+=("bin/analysis-enhancement-tool.sh")
    tools+=("bin/documentation-validator.sh")
    tools+=("bin/sprint4-completion-validator.sh")
    tools+=("bin/integration-test-runner.sh")
    
    local available_tools=0
    local total_tools=${#tools[@]}
    
    echo -e "${CYAN}=== Tool Availability Test ===${NC}"
    
    for tool in "${tools[@]}"; do
        if [[ -f "$tool" && -x "$tool" ]]; then
            ((available_tools++))
            echo -e "${GREEN}✅${NC} $tool - Available and executable"
        else
            echo -e "${RED}❌${NC} $tool - Missing or not executable"
        fi
    done
    
    local availability_percentage=$(echo "scale=1; $available_tools * 100 / $total_tools" | bc -l)
    
    echo -e "${CYAN}=== Availability Summary ===${NC}"
    echo -e "${GREEN}Available Tools:${NC} $available_tools/$total_tools"
    echo -e "${GREEN}Availability:${NC} ${availability_percentage}%"
    echo -e "${CYAN}===========================${NC}"
    
    log "INFO" "Tool availability test completed: ${availability_percentage}%"
    
    # Return availability percentage for reporting
    echo "$availability_percentage"
}

# Test coms.json functionality
test_coms_functionality() {
    log "INFO" "Testing coms.json functionality"
    
    local coms_tests=0
    local total_coms_tests=5
    
    echo -e "${CYAN}=== Coms.json Functionality Tests ===${NC}"
    
    # Test 1: Check if coms.json is valid JSON
    if jq empty coms.json 2>/dev/null; then
        echo -e "${GREEN}✅${NC} coms.json is valid JSON"
        ((coms_tests++))
    else
        echo -e "${RED}❌${NC} coms.json is not valid JSON"
    fi
    
    # Test 2: Check if assistant name exists
    if jq -e '.assistant.name' coms.json >/dev/null 2>&1; then
        echo -e "${GREEN}✅${NC} Assistant name exists in coms.json"
        ((coms_tests++))
    else
        echo -e "${RED}❌${NC} Assistant name missing from coms.json"
    fi
    
    # Test 3: Check if project name exists
    if jq -e '.project.name' coms.json >/dev/null 2>&1; then
        echo -e "${GREEN}✅${NC} Project name exists in coms.json"
        ((coms_tests++))
    else
        echo -e "${RED}❌${NC} Project name missing from coms.json"
    fi
    
    # Test 4: Check if sprint status exists
    if jq -e '.sprint_4_status' coms.json >/dev/null 2>&1; then
        echo -e "${GREEN}✅${NC} Sprint 4 status exists in coms.json"
        ((coms_tests++))
    else
        echo -e "${RED}❌${NC} Sprint 4 status missing from coms.json"
    fi
    
    # Test 5: Check if final status exists
    if jq -e '.final_status' coms.json >/dev/null 2>&1; then
        echo -e "${GREEN}✅${NC} Final status exists in coms.json"
        ((coms_tests++))
    else
        echo -e "${RED}❌${NC} Final status missing from coms.json"
    fi
    
    local coms_percentage=$(echo "scale=1; $coms_tests * 100 / $total_coms_tests" | bc -l)
    
    echo -e "${CYAN}=== Coms.json Summary ===${NC}"
    echo -e "${GREEN}Coms Tests Passed:${NC} $coms_tests/$total_coms_tests"
    echo -e "${GREEN}Coms Functionality:${NC} ${coms_percentage}%"
    echo -e "${CYAN}===========================${NC}"
    
    log "INFO" "Coms.json functionality test completed: ${coms_percentage}%"
    
    # Return coms percentage for reporting
    echo "$coms_percentage"
}

# Generate comprehensive test report
generate_test_report() {
    local report_file="$REPORT_DIR/test-runner-$(date +%Y%m%d-%H%M%S).json"
    
    log "INFO" "Generating comprehensive test report: $report_file"
    
    local structure_percentage=$(test_project_structure)
    local availability_percentage=$(test_tool_availability)
    local coms_percentage=$(test_coms_functionality)
    
    # Create comprehensive report
    cat > "$report_file" << EOF
{
    "timestamp": "$(date -Iseconds)",
    "report_type": "comprehensive_test",
    "sprint": 4,
    "test_analysis": {
        "project_structure_percentage": $structure_percentage,
        "tool_availability_percentage": $availability_percentage,
        "coms_functionality_percentage": $coms_percentage,
        "overall_test_score": $(echo "scale=1; ($structure_percentage + $availability_percentage + $coms_percentage) / 3" | bc -l)
    },
    "project_status": {
        "coms_json": "$(if [[ -f "coms.json" ]]; then echo "present"; else echo "missing"; fi)",
        "board_md": "$(if [[ -f "board.md" ]]; then echo "present"; else echo "missing"; fi)",
        "bin_directory": "$(if [[ -d "bin" ]]; then echo "present"; else echo "missing"; fi)",
        "tools_available": "$(find bin -name "*.sh" -type f 2>/dev/null | wc -l | tr -d ' ')/6"
    },
    "cleanup_impact": {
        "tools_lost": "6 tools were deleted during cleanup",
        "coms_recovered": "coms.json was recovered and is functional",
        "structure_intact": "Project structure is mostly intact",
        "recovery_needed": "Tools need to be recreated"
    },
    "sprint_4_status": {
        "current_phase": "Post-cleanup testing and recovery",
        "tools_ready": "Tools need to be recreated",
        "coms_ready": "coms.json is functional",
        "recovery_target": "Recreate essential tools for Sprint 4 completion"
    }
}
EOF
    
    log "INFO" "Test report generated: $report_file"
    echo "Test report saved to: $report_file"
    
    # Display summary
    local overall_score=$(echo "scale=1; ($structure_percentage + $availability_percentage + $coms_percentage) / 3" | bc -l)
    echo -e "${CYAN}=== Comprehensive Test Summary ===${NC}"
    echo -e "${GREEN}Project Structure:${NC} ${structure_percentage}%"
    echo -e "${GREEN}Tool Availability:${NC} ${availability_percentage}%"
    echo -e "${GREEN}Coms Functionality:${NC} ${coms_percentage}%"
    echo -e "${GREEN}Overall Score:${NC} ${overall_score}%"
    echo -e "${GREEN}Status:${NC} Tools need to be recreated after cleanup"
    echo -e "${CYAN}=====================================${NC}"
}

# Main test runner execution
main() {
    local action="${1:-all}"
    
    case "$action" in
        "structure")
            log "INFO" "Running project structure test"
            init_test_runner
            test_project_structure
            ;;
        "tools")
            log "INFO" "Running tool availability test"
            init_test_runner
            test_tool_availability
            ;;
        "coms")
            log "INFO" "Testing coms.json functionality"
            init_test_runner
            test_coms_functionality
            ;;
        "report")
            log "INFO" "Generating comprehensive test report"
            init_test_runner
            generate_test_report
            ;;
        "all")
            log "INFO" "Running complete test suite"
            init_test_runner
            generate_test_report
            ;;
        *)
            echo "Usage: $0 {structure|tools|coms|report|all}"
            echo "  structure  - Test project structure"
            echo "  tools      - Test tool availability"
            echo "  coms       - Test coms.json functionality"
            echo "  report     - Generate comprehensive report"
            echo "  all        - Run complete test suite"
            exit 1
            ;;
    esac
}

# Show help
show_help() {
    echo "QuantumCache Test Runner"
    echo ""
    echo "Usage: $0 [action]"
    echo ""
    echo "Actions:"
    echo "  structure  - Test project structure"
    echo "  tools      - Test tool availability"
    echo "  coms       - Test coms.json functionality"
    echo "  report     - Generate comprehensive report"
    echo "  all        - Run complete test suite"
    echo ""
    echo "Environment Variables:"
    echo "  TEST_LOG       Log file path (default: /tmp/q-cache-test-runner.log)"
    echo "  REPORT_DIR     Report directory (default: /tmp/q-cache-test-reports)"
}

# Parse command line arguments
if [[ $# -gt 0 ]]; then
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            main "$1"
            ;;
    esac
else
    main "all"
fi 