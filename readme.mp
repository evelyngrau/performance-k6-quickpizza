# API Performance Testing with Grafana k6

<p align="center">
  <a href="https://evelyngrau.github.io/k6-api-performance-testing/reports/k6-report.html">
    <img
      src="https://img.shields.io/badge/View%20HTML%20Report-k6-7D64FF?style=for-the-badge&logo=k6"
      alt="View k6 HTML Report"
    />
  </a>
</p>

## Overview

This project demonstrates a lightweight API performance testing workflow using
Grafana k6.

The test evaluates the reliability and response time of a public QuickPizza API
endpoint under a small, progressively increasing workload.

The project focuses on performance test design, automated acceptance criteria,
result interpretation, and professional reporting.

## Objectives

- Execute an API load test using virtual users.
- Apply a gradual ramp-up and ramp-down workload.
- Validate API reliability under concurrent requests.
- Measure response time percentiles and request failure rate.
- Define automated performance thresholds.
- Generate a shareable HTML performance report.
- Document findings and limitations clearly.

## Technology Stack

- Grafana k6
- JavaScript
- PowerShell
- Git and GitHub
- GitHub Pages
- k6 Web Dashboard

## System Under Test

- Application: QuickPizza
- Test type: API average-load test
- Environment: Public demonstration environment
- Target endpoint: `GET /api/names`

> The workload was deliberately kept small because the application is a
> shared public demonstration environment.

## Workload Profile

The scenario uses the `ramping-vus` executor to increase and reduce concurrent
virtual users progressively.

| Stage | Duration | Target VUs |
|---|---:|---:|
| Ramp-up | 10 seconds | 2 |
| Increase | 30 seconds | 5 |
| Steady load | 30 seconds | 5 |
| Ramp-down | 10 seconds | 0 |

Maximum concurrent virtual users: **5**

Total configured duration: **1 minute 20 seconds**

## Performance Acceptance Criteria

| Metric | Threshold |
|---|---:|
| HTTP request failure rate | `< 1%` |
| P95 response time | `< 1000 ms` |
| Successful checks | `> 99%` |

Thresholds act as automated quality gates. A threshold breach causes the k6
execution to return a failed status.

## Final Results

| Metric | Expected | Actual | Status |
|---|---:|---:|---|
| HTTP request failure rate | `< 1%` | ADD FINAL RESULT | PASS / FAIL |
| P95 response time | `< 1000 ms` | ADD FINAL RESULT | PASS / FAIL |
| Successful checks | `> 99%` | ADD FINAL RESULT | PASS / FAIL |
| Total HTTP requests | Informational | ADD FINAL RESULT | N/A |
| Average response time | Informational | ADD FINAL RESULT | N/A |
| Maximum response time | Informational | ADD FINAL RESULT | N/A |

## HTML Report

The complete report includes:

- Request duration trends
- Response time percentiles
- HTTP failure rate
- Iteration metrics
- Virtual-user activity
- Threshold results
- Network usage

[Open the complete k6 HTML report](https://evelyngrau.github.io/k6-api-performance-testing/reports/k6-report.html)

## Project Structure

```text
k6-api-performance-testing/
├── tests/
│   └── quickpizza-load-test.js
├── reports/
│   └── k6-report.html
├── README.md
└── .gitignore
```

## Installation

Verify the k6 installation:

```powershell
k6 version
```

## Running the Test

Run the test from the project root:

```powershell
k6 run .\tests\quickpizza-load-test.js
```

## Running the Test with the Web Dashboard

```powershell
$env:K6_WEB_DASHBOARD="true"
$env:K6_WEB_DASHBOARD_OPEN="true"

k6 run .\tests\quickpizza-load-test.js
```

The local dashboard is normally available at:

```text
http://127.0.0.1:5665
```

## Generating the HTML Report

```powershell
$env:K6_WEB_DASHBOARD="true"
$env:K6_WEB_DASHBOARD_OPEN="true"
$env:K6_WEB_DASHBOARD_EXPORT="reports/k6-report.html"

k6 run .\tests\quickpizza-load-test.js
```

The report is generated automatically after the execution:

```text
reports/k6-report.html
```

## Key Concepts Practised

### Virtual Users

Virtual users simulate concurrent users repeatedly executing the test function.

### Ramping Workload

The workload gradually increases instead of applying the maximum load
immediately. This makes it easier to observe whether performance changes as
concurrency grows.

### Checks

Checks validate functional aspects of each response, such as HTTP status,
response format, and expected response data.

### Thresholds

Thresholds define the minimum acceptable quality level for the complete test
execution.

### Response-Time Percentiles

The P95 response time represents the value below which 95% of the measured
requests completed.

It provides a more representative performance indicator than relying only on
the average response time.

### Error Rate

The HTTP request failure rate measures the proportion of failed requests during
the execution.

### Think Time

A short pause between iterations prevents each virtual user from sending
requests continuously without user-like delay.

## Key Learnings

- Performance test scripts should be based on the actual API contract.
- Functional validation remains necessary during performance testing.
- Checks and thresholds serve different purposes.
- Checks record whether individual validations passed.
- Thresholds determine whether the complete execution is acceptable.
- Percentiles provide more useful information than averages alone.
- Workload size should be based on requirements or production traffic data.
- Public environments require conservative and responsible load levels.
- A failed check does not always indicate a performance defect; it may reveal
  an incorrect test assumption.
- Results should be interpreted within the context and limitations of the
  execution environment.

## Findings

After correcting the response-body validation, the API:

- ADD FINAL OBSERVATION.
- ADD WHETHER ALL CHECKS PASSED.
- ADD WHETHER ERRORS WERE OBSERVED.
- ADD WHETHER THE P95 THRESHOLD WAS MET.
- ADD WHETHER RESPONSE TIMES REMAINED STABLE.

## Limitations

- The system under test is a shared public demonstration environment.
- The test was executed from a local machine.
- Network latency may influence the results.
- Server-side CPU, memory, database, and infrastructure metrics were unavailable.
- The workload was limited to five concurrent virtual users.
- The results do not demonstrate production-scale capacity.

## Potential Improvements

- Add separate smoke, load, stress, and spike scenarios.
- Use environment variables for configurable base URLs.
- Test multiple API endpoints as part of a realistic user journey.
- Add endpoint-specific thresholds using tags.
- Store historical results for execution comparison.
- Integrate the test into GitHub Actions.
- Correlate k6 results with server-side observability metrics.

## Author

**Evelyn Grau**

QA Engineer focused on manual testing, automation, API quality,
performance testing, and AI-assisted QA workflows.