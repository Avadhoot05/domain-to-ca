# Firefox Domain Trust Implementation Backlog

Revision 1.0. All 48 items are planned; implementation repositories have not been inspected. Read CODEX_START.md and the report before implementation. The YAML file is the structured source of truth.

## Issue index

| ID | Milestone | Owner | Execution | Title |
|---|---|---|---|---|
| FDT-001 | M0 | integration | hybrid | Freeze the Firefox and Chrome implementation baselines |
| FDT-002 | M0 | architecture | hybrid | Freeze guarantees and inherited conformance traceability |
| FDT-003 | M0 | gecko | hybrid | Map every native authentication and data admission path |
| FDT-004 | M0 | qualification | codex | Build the local PKI and evidence recording harness |
| FDT-005 | M1 | addon | codex | Implement the standard Firefox observation add-on |
| FDT-006 | M1 | addon | hybrid | Qualify add-on permissions startup and deployment |
| FDT-007 | M1 | qualification | hybrid | Measure disclosure before the add-on certificate check |
| FDT-008 | M1 | architecture | hybrid | Publish the add-on feasibility and native scope decision |
| FDT-009 | M2 | policy | codex | Define the cross-browser domain trust policy schema |
| FDT-010 | M2 | policy | codex | Implement immutable snapshots and protected enrollment |
| FDT-011 | M2 | policy | codex | Implement canonical hostname matching and delegation boundaries |
| FDT-012 | M2 | gecko | codex | Validate and scope policy-supplied CA material |
| FDT-013 | M2 | gecko | codex | Carry policy context and typed authorization through PSM |
| FDT-014 | M2 | gecko | codex | Filter eligible trust anchors before mozpkix path construction |
| FDT-015 | M2 | gecko | codex | Enforce intermediate requirements and final chain postconditions |
| FDT-016 | M2 | gecko | codex | Make policy failures non-overridable in the managed product |
| FDT-017 | M2 | qualification | hybrid | Qualify static H1 and H2 native enforcement |
| FDT-018 | M2 | gecko | codex | Partition verifier trust and certificate caches by policy |
| FDT-019 | M2 | gecko | codex | Implement native diagnostics and truthful audit mode |
| FDT-020 | M3 | network | codex | Integrate native policy with HTTP3 authentication |
| FDT-021 | M3 | network | codex | Bind ECH proxy and alternate routes to origin policy |
| FDT-022 | M3 | network | codex | Close WebTransport certificate-hash authentication bypasses |
| FDT-023 | M3 | network | codex | Preserve policy across fallback redirects and WebSockets |
| FDT-024 | M3 | network | codex | Implement policy checks at request and stream admission |
| FDT-025 | M3 | network | codex | Make HTTP2 and HTTP3 coalescing origin-policy aware |
| FDT-026 | M3 | network | codex | Bind resumption to current policy and authorization lifetime |
| FDT-027 | M3 | network | codex | Gate early data and TLS application-data shortcuts |
| FDT-028 | M3 | network | codex | Implement atomic policy activation across processes |
| FDT-029 | M3 | network | codex | Handle policy certificate and authorization expiry on live sessions |
| FDT-030 | M3 | gecko | codex | Invalidate affected cached documents and worker execution |
| FDT-031 | M3 | qualification | hybrid | Qualify browser surfaces and context isolation |
| FDT-032 | M3 | qualification | hybrid | Qualify OS roots and private PKI over HTTP3 |
| FDT-033 | M4 | policy | codex | Implement signed bundle verification and signer separation |
| FDT-034 | M4 | policy | codex | Persist rollback floors and unexpired last-known-good state |
| FDT-035 | M4 | policy | codex | Integrate authenticated asynchronous policy distribution |
| FDT-036 | M4 | controller | codex | Integrate the shared controller and cross-browser policy compiler |
| FDT-037 | M4 | controller | codex | Implement authorized domain onboarding and constrained delegation |
| FDT-038 | M4 | controller | codex | Implement old and new CA overlap and application version coexistence |
| FDT-039 | M4 | controller | codex | Implement emergency revocation and root-authorized recovery |
| FDT-040 | M4 | controller | codex | Add policy audit history and fleet health integration |
| FDT-041 | M4 | qualification | hybrid | Qualify full policy lifecycle across both browser adapters |
| FDT-042 | M5 | release | hybrid | Build pinned Linux and macOS product packages |
| FDT-043 | M5 | release | hybrid | Provide CI gates and authenticated product updates |
| FDT-044 | M5 | qualification | codex | Add fuzzing differential and fail-open mutation testing |
| FDT-045 | M5 | qualification | hybrid | Run paired performance and scale experiments |
| FDT-046 | M5 | qualification | hybrid | Execute all inherited conformance and new Firefox cases |
| FDT-047 | M5 | release | hybrid | Evaluate rebases and define continuing security maintenance |
| FDT-048 | M5 | architecture | independent_review | Perform independent security review and publish qualification |

## FDT-001 Freeze the Firefox and Chrome implementation baselines

Establish exactly which code and platforms the programme will evaluate.

Milestone: M0. Owner: integration. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: none. Chrome references: FORK-01, FORK-04, FORK-06, FORK-07, FORK-11.
Invariants: F1, F6, F9. Experiments: FDE-10.

**Deliverables**

- baseline.json with upstream release/commit, NSS/Neqo versions, toolchains, OS and architecture.
- Inventory actual Chrome, policy-controller and packaging repositories; record absent implementations explicitly.

**Acceptance criteria**

- A clean native Firefox build can be reproduced on the first Linux runner.
- Every source link used for implementation is pinned to a commit; the two prior reports are identified by digest.
- No old backlog entry is assumed implemented from its title alone.

**Tests**

- Clean native build and startup smoke run.
- Inventory and source-digest verification.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-001: Freeze the Firefox and Chrome implementation baselines. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-002 Freeze guarantees and inherited conformance traceability

Make equivalence and its exceptions reviewable before coding.

Milestone: M0. Owner: architecture. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-001. Chrome references: VER-12, TST-06, TST-10.
Invariants: F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12. Experiments: FDE-02.

**Deliverables**

- Threat model, F1–F12 and supported-surface matrix.
- Machine-readable mappings for all 62 Chrome work packages and C-01–C-50 cases.

**Acceptance criteria**

- Browser-source extension and standard add-on are separate assurance modes.
- Endpoint rollback, CA compromise, attestation freshness, and protocol availability assumptions are explicit.
- Protected scope release, expiry and update cutover have normative semantics.

**Tests**

- Traceability completeness check.
- Owner review of every deviation and unqualified platform.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-002: Freeze guarantees and inherited conformance traceability. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-003 Map every native authentication and data admission path

Identify concrete patch points and alternative paths on the pinned revision.

Milestone: M0. Owner: gecko. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-001, FDT-002. Chrome references: VER-03, VER-04, NET-01, NET-08.
Invariants: F3, F4, F6, F8, F11. Experiments: FDE-04.

**Deliverables**

- Source map for CertVerifier, NSSCertDBTrustDomain, trust caches, IPC, sessions and Necko dispatch.
- Coverage for H1/H2/H3, WebSocket, WebTransport hashes, ECH, proxies, early data, overrides and automation.

**Acceptance criteria**

- Current trust-cache keys and trust-source precedence are documented from actual code.
- Every protected-data path has an enforcement owner or an explicit block plan.
- An ECH public name cannot be mistaken for the requested protected origin.

**Tests**

- Instrumented call traces on TCP and H3.
- Review alternative authentication branches and all validation retry branches.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-003: Map every native authentication and data admission path. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-004 Build the local PKI and evidence recording harness

Provide reproducible certificate scenarios and a trustworthy disclosure oracle.

Milestone: M0. Owner: qualification. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-001, FDT-002. Chrome references: TST-01.
Invariants: F4, F6, F11. Experiments: FDE-01, FDE-02, FDE-03, FDE-04.

**Deliverables**

- Test-only roots, intermediate variants, old/new keys, cross-signs, distrust and revocation fixtures.
- H1/H2/H3 endpoint controls, unique request canaries and structured server logs.
- Evidence schema with actual outcome and negotiated-protocol fields.

**Acceptance criteria**

- Stock control can reach each intended valid endpoint and fail each ordinary-invalid endpoint.
- A TLS handshake is distinguishable from application request receipt.
- No real credentials, global security bypass, or production private keys enter fixtures.

**Tests**

- Recreate semantic fixtures and compare digests.
- Positive controls for canary receipt and negative controls for absent traffic.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-004: Build the local PKI and evidence recording harness. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-005 Implement the standard Firefox observation add-on

Create the API-only comparison implementation with honest user-facing claims.

Milestone: M1. Owner: addon. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-002, FDT-004. Chrome references: VER-09, POL-08.
Invariants: F2, F5. Experiments: FDE-01, FDE-11.

**Deliverables**

- Minimal manifest and blocking onHeadersReceived listener.
- Use supplied SPKI SHA-256 digests and validated chain ordering.
- Observation, mismatch and unavailable states with bounded logs.

**Acceptance criteria**

- No issuer-name comparison or arbitrary server certificate grants approval.
- Absent chain data, exception state, and digest parsing errors never produce an approved state.
- UI never claims pre-request enforcement or attestation.

**Tests**

- Approved and unapproved roots, missing fields, malformed Base64 and callback rejection.
- Event-order capture for the actual supported Firefox version.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-005: Implement the standard Firefox observation add-on. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-006 Qualify add-on permissions startup and deployment

Measure which browser request surfaces the standard extension observes.

Milestone: M1. Owner: addon. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-005. Chrome references: TST-06, FORK-09.
Invariants: F5, F11. Experiments: FDE-11.

**Deliverables**

- Host and initiator permission plan, startup listeners and private-window configuration.
- Signed XPI build and managed-install fixture for the qualified channel.

**Acceptance criteria**

- Main frames, cross-origin subresources, workers, downloads and private windows have explicit coverage results.
- Permissions withdrawn, add-on unavailable, and startup races never retain an enforcement badge.
- Signing and enterprise installation are tested without disabling signing in the product profile.

**Tests**

- Permission and private-window matrix.
- Cold start, session restore, update, reinstall and listener failure.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-006: Qualify add-on permissions startup and deployment. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-007 Measure disclosure before the add-on certificate check

Demonstrate the exact timing limit with actual browser and server evidence.

Milestone: M1. Owner: qualification. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-004, FDT-005, FDT-006. Chrome references: TST-06.
Invariants: F11. Experiments: FDE-01.

**Deliverables**

- FDE-01 stock and add-on runs with synthetic cookie, authorization and POST canaries.
- Event and server timelines with connection IDs and body byte counts.

**Acceptance criteria**

- The normally trusted but unapproved endpoint is accepted by the stock control.
- Report observed data before cancellation, including partial streamed-body results.
- Add-on response blocking is never counted as prevention of already transmitted data.

**Tests**

- GET, POST, redirects, auth retry, upload and reconnect cases.
- Repeat with cold and reused H2/H3 connections where observable.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-007: Measure disclosure before the add-on certificate check. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-008 Publish the add-on feasibility and native scope decision

Close the feasibility experiment without silently reducing the security objective.

Milestone: M1. Owner: architecture. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-003, FDT-007. Chrome references: VER-09, VER-12.
Invariants: F5, F11. Experiments: FDE-01, FDE-11.

**Deliverables**

- Measured feasibility note and source-to-runtime comparison.
- Decision record retaining native enforcement and optional diagnostics roles.

**Acceptance criteria**

- Preflight/native-messaging probe limitations and connection binding are explicit.
- Any unsupported add-on surface remains visible in the results.
- The decision references actual FDE-01 artifacts.

**Tests**

- Independent review against F1–F12.
- Validate report statements against evidence, not UI screenshots alone.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-008: Publish the add-on feasibility and native scope decision. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-009 Define the cross-browser domain trust policy schema

Preserve Chrome semantics while negotiating Firefox capabilities explicitly.

Milestone: M2. Owner: policy. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-002, FDT-003. Chrome references: POL-01, CFG-01.
Invariants: F2, F4, F9, F10, F12. Experiments: FDE-02, FDE-06.

**Deliverables**

- Versioned schema for authorities, rules, scope, required intermediates, revocations and feature requirements.
- Critical-field and cross-browser compatibility rules; bounded integer generations.

**Acceptance criteria**

- Anchor and intermediate conditions are independent and unambiguous.
- Unknown critical features, duplicate keys and same-generation different payloads are rejected.
- Chrome browser-version strings are not used as Firefox compatibility checks.

**Tests**

- Schema positive/negative corpus and cross-browser vectors.
- Empty allowlist, conflicting rules and unknown enum tests.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-009: Define the cross-browser domain trust policy schema. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-010 Implement immutable snapshots and protected enrollment

Give static and later dynamic enforcement a safe initialization boundary.

Milestone: M2. Owner: policy. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-009. Chrome references: POL-06, POL-07.
Invariants: F5, F9, F12. Experiments: FDE-06.

**Deliverables**

- Immutable snapshot type, compiled-in test policy and enrollment scope.
- Explicit unavailable, active and expired states; retained-scope representation.

**Acceptance criteria**

- Protected startup cannot fall through to baseline when policy is absent.
- Snapshot lifetime is safe across worker threads and IPC ownership.
- Test-policy injection cannot be enabled by website content or an ordinary preference in production.

**Tests**

- Missing/corrupt state, startup ordering and concurrent readers.
- Memory/lifetime checks with snapshot replacement.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-010: Implement immutable snapshots and protected enrollment. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-011 Implement canonical hostname matching and delegation boundaries

Select exactly one authorized rule using browser-consistent identity.

Milestone: M2. Owner: policy. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-009, FDT-010. Chrome references: POL-02, POL-03, POL-05, TST-02.
Invariants: F2, F9. Experiments: FDE-02, FDE-12.

**Deliverables**

- Gecko canonicalization adapter and reverse-label matcher.
- Apex, suffix, child delegation, IP and public-suffix rules.

**Acceptance criteria**

- C-01–C-09 map to explicit vectors including evil-scone.cloud and scone.cloud.evil.
- Child precedence requires authorized scope and cannot silently weaken a parent.
- IDNA, case and trailing-dot inputs have consistent browser and policy results.

**Tests**

- Property tests for label-boundary and longest-authorized-match behavior.
- Malformed names, Unicode separator, conflict and public-suffix corpus.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-011: Implement canonical hostname matching and delegation boundaries. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-012 Validate and scope policy-supplied CA material

Add private trust only from authenticated and constrained authority objects.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-009, FDT-010, FDT-011. Chrome references: POL-04, VER-07, VER-08.
Invariants: F1, F3, F4. Experiments: FDE-02, FDE-03.

**Deliverables**

- Authority validation using established certificate parsing.
- Separate scoped anchor and issuer inputs with effective constraints.

**Acceptance criteria**

- SPKI-only authorization never trusts arbitrary server-supplied DER.
- CA role, key usage, permitted scope, validity policy and explicit distrust are enforced.
- Unmatched TLS, email and unrelated certificate uses cannot access policy-only anchors.

**Tests**

- Subordinate-as-anchor, expired anchor, Name Constraints and digest mismatch tests.
- Same-key reissued certificate with broader constraints remains constrained or rejected.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-012: Validate and scope policy-supplied CA material. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-013 Carry policy context and typed authorization through PSM

Bind verifier results to the correct origin and snapshot.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-003, FDT-010, FDT-011. Chrome references: VER-01, VER-06, NET-02.
Invariants: F5, F6, F9, F11. Experiments: FDE-04, FDE-05, FDE-12.

**Deliverables**

- Typed context and result fields; parent/socket-process serialization.
- Explicit trust-source representation without private-to-built-in relabeling.

**Acceptance criteria**

- Origin, purpose, generation, rule digest and terminal SPKI survive the full asynchronous path.
- Unknown or missing context cannot authorize protected application traffic.
- Policy data and digest lengths are bounded at IPC boundaries.

**Tests**

- Serialization and stale-job tests.
- Socket-process on/off and shutdown failure paths.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-013: Carry policy context and typed authorization through PSM. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-014 Filter eligible trust anchors before mozpkix path construction

Implement the native exclusive-anchor property without global root edits.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-003, FDT-011, FDT-012, FDT-013. Chrome references: VER-03, VER-04, TST-03.
Invariants: F1, F3, F4, F6. Experiments: FDE-02, FDE-03.

**Deliverables**

- Request-scoped trust adapter integrated in every TLS server validation branch.
- Preserved issuer enumeration and explicit distrust handling.

**Acceptance criteria**

- An unapproved baseline anchor becomes InheritsTrust while real distrust stays denied.
- Every EV/DV or algorithm retry retains the same scoped policy.
- No-rule verification delegates unchanged and approved alternate paths remain discoverable.

**Tests**

- Approved/unapproved/local/unknown root matrix.
- Cross-signed candidates, issuer order and deliberately distrusted approved keys.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-014: Filter eligible trust anchors before mozpkix path construction. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-015 Enforce intermediate requirements and final chain postconditions

Reject paths that do not satisfy the whole rule while preserving backtracking.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-014. Chrome references: VER-05, TST-04.
Invariants: F3, F4, F5. Experiments: FDE-02, FDE-03.

**Deliverables**

- Chain-construction predicate and final success check.
- Normalized anchor/leaf ordering and explicit failure reasons.

**Acceptance criteria**

- Only certificates in the completed validated path satisfy requirements.
- IsChainValid success alone never publishes authorization before remaining checks pass.
- A valid alternate path containing the required intermediate can succeed.

**Tests**

- Server certificate-bag injection and reversed-chain tests.
- Forced filter defect, wrong intermediate, alternate intermediate and post-callback revocation failure.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-015: Enforce intermediate requirements and final chain postconditions. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-016 Make policy failures non-overridable in the managed product

Prevent certificate exceptions and automation paths from bypassing policy.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-013, FDT-015. Chrome references: VER-02, POL-08, NET-08.
Invariants: F1, F4, F11. Experiments: FDE-02, FDE-04.

**Deliverables**

- Dedicated typed policy errors and UI mapping.
- Gate existing exception handling and insecure automation settings for protected origins.

**Acceptance criteria**

- Saved exceptions and UI proceed actions cannot authorize a rejected protected connection.
- Tests using acceptInsecureCerts cannot count as release evidence.
- Ordinary unmatched Firefox error behavior is preserved.

**Tests**

- Preexisting exceptions, fresh exceptions, hidden buttons and automation override attempts.
- Policy failures during H3 fallback retain denial.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-016: Make policy failures non-overridable in the managed product. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-017 Qualify static H1 and H2 native enforcement

Prove certificate enforcement and no protected request disclosure on real connections.

Milestone: M2. Owner: qualification. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-004, FDT-014, FDT-015, FDT-016. Chrome references: TST-03, TST-04, TST-06.
Invariants: F1, F3, F4, F11. Experiments: FDE-01, FDE-02, FDE-03.

**Deliverables**

- Native slice of FDE-01 and C-10–C-26 results.
- Server canary evidence and baseline differential report.

**Acceptance criteria**

- Unapproved valid endpoints receive zero protected HTTP request bytes.
- Approved endpoints work and ordinary invalid chains remain invalid.
- Missing issuer fetch behavior is reported honestly; no new unbounded AIA fetch is introduced to force a pass.

**Tests**

- Cookies, POST, authorization, cross-signing and constrained anchors.
- Native verifier tests plus real H1/H2 browser requests.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-017: Qualify static H1 and H2 native enforcement. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-018 Partition verifier trust and certificate caches by policy

Prevent cached positive trust from bypassing scoped validation.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-013, FDT-014, FDT-015. Chrome references: VER-10, NET-06.
Invariants: F3, F4, F5, F8. Experiments: FDE-02, FDE-05, FDE-06.

**Deliverables**

- Inventory and patch of relevant cache keys/invalidation.
- Generation/rule-aware authorization caching with time bounds.

**Acceptance criteria**

- No-rule and protected results cannot share incompatible positive authorization.
- Underlying shared trust caches cannot bypass the per-call filtering decision.
- Expiry and distrust changes invalidate authorization even if the policy generation is unchanged.

**Tests**

- Warm-cache wrong-anchor and new-rule transitions.
- Certificate expiry, negative-cache lifetime and trust-store changes.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-018: Partition verifier trust and certificate caches by policy. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-019 Implement native diagnostics and truthful audit mode

Make enforcement and observation states distinguishable without exposing browsing data.

Milestone: M2. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-013, FDT-015, FDT-016, FDT-018. Chrome references: POL-08, VER-09, CFG-12.
Invariants: F1, F5, F9. Experiments: FDE-11.

**Deliverables**

- Privileged diagnostics page and bounded events.
- Audit-only evaluation that cannot grant private trust or alter baseline results.

**Acceptance criteria**

- UI distinguishes native enforced, audit, expired, unavailable and ordinary TLS.
- An add-on badge cannot fabricate native authorization.
- Record rule IDs, digests and counts; omit cookies, page data and full browsing URLs.

**Tests**

- Navigation races and stale-tab indicators.
- Audit baseline equivalence and telemetry redaction checks.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-019: Implement native diagnostics and truthful audit mode. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-020 Integrate native policy with HTTP3 authentication

Give HTTP3 the same authenticated policy disposition as TCP TLS.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-003, FDT-013, FDT-015, FDT-016, FDT-017. Chrome references: NET-01, TST-05.
Invariants: F4, F5, F6, F7, F11. Experiments: FDE-04, FDE-07.

**Deliverables**

- Neqo/PSM result integration and H3 data-admission gate.
- Actual private-root transport heuristic inventory on the pinned build.

**Acceptance criteria**

- Approved private roots work over actual H3 where network routing permits.
- Unknown or unapproved roots never become trusted through protocol heuristics.
- No blanket QUIC disablement or fabricated built-in-root status supplies a pass.

**Tests**

- H3 approved/local/unknown/explicitly-distrusted matrix.
- ALPN and server-protocol assertions with forced H3 availability.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-020: Integrate native policy with HTTP3 authentication. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-021 Bind ECH proxy and alternate routes to origin policy

Keep destination authorization separate from route or fallback authentication.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-003, FDT-020. Chrome references: NET-01, NET-08, TST-06.
Invariants: F2, F5, F6, F11. Experiments: FDE-04.

**Deliverables**

- Typed requested-origin and verification-purpose propagation.
- Proxy outer/inner and Alt-Svc/DNS route treatment.

**Acceptance criteria**

- CNAME, Alt-Svc, HTTPS RR and ECH public name cannot substitute the protected origin.
- ECH fallback authentication alone releases no protected application data.
- Mandatory proxy routing remains effective when H3 is available.

**Tests**

- ECH retry/public-name changes and controlled DNS routing.
- HTTPS proxy outer trust plus unapproved inner certificate; H3 versus explicit proxy.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-021: Bind ECH proxy and alternate routes to origin policy. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-022 Close WebTransport certificate-hash authentication bypasses

Apply protected-origin policy to alternate application-selected trust paths.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-003, FDT-020, FDT-021. Chrome references: TST-06, NET-08.
Invariants: F1, F6, F8, F11. Experiments: FDE-04.

**Deliverables**

- Explicit hash-only WebTransport block for protected origins in the first profile.
- PKI WebTransport admission through current native authorization.

**Acceptance criteria**

- A website cannot authorize a protected endpoint using serverCertificateHashes alone.
- Unmatched WebTransport retains baseline behavior.
- Unsupported protected modes fail with a documented reason before application data.

**Tests**

- Hash-only valid/invalid certificates, PKI mode, streams and datagrams.
- Policy activation while a WebTransport session exists.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-022: Close WebTransport certificate-hash authentication bypasses. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-023 Preserve policy across fallback redirects and WebSockets

Prevent network retries and non-document requests from changing the trust decision.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-020, FDT-021, FDT-022. Chrome references: NET-08, TST-06.
Invariants: F1, F2, F6, F11. Experiments: FDE-04, FDE-11.

**Deliverables**

- Per-attempt policy checks for TCP/H3 retry, redirects and WebSocket handshakes.
- Protected cleartext HTTP/WS rejection before sending secrets.

**Acceptance criteria**

- Certificate-policy failure never succeeds through an unrestricted retry.
- Each redirected destination uses its own current rule.
- Unmatched destinations are not falsely described as certified; app-level allowlists remain a separate concern.

**Tests**

- H3-to-H2 and H1 retry, POST redirects, WSS reconnect and cleartext attempts.
- Network-only fallback retains expected availability.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-023: Preserve policy across fallback redirects and WebSockets. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-024 Implement policy checks at request and stream admission

Close the race between successful verification and later use.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-013, FDT-018, FDT-020, FDT-023. Chrome references: NET-02, NET-05.
Invariants: F5, F8, F11. Experiments: FDE-05.

**Deliverables**

- Current-policy admission predicate for H1/H2/H3 and long-lived streams.
- Recheck stale verification completion and classify active connections.

**Acceptance criteria**

- No affected request is admitted after its authorization becomes invalid.
- A completed old-generation verifier job cannot revive retired authority.
- The guarantee explicitly excludes bytes admitted before the cutover boundary.

**Tests**

- Deterministic thread barriers between verification, pool lookup and write admission.
- Stream-open races, partial writes and network-process stalls.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-024: Implement policy checks at request and stream admission. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-025 Make HTTP2 and HTTP3 coalescing origin-policy aware

Allow efficient reuse only when the candidate origin is independently authorized.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-011, FDT-018, FDT-024. Chrome references: NET-03, NET-04, TST-07.
Invariants: F1, F2, F5, F8. Experiments: FDE-02, FDE-05.

**Deliverables**

- Conservative protected coalescing block followed by qualified same-rule reuse.
- Rule identity, origin attributes and current policy in join decisions.

**Acceptance criteria**

- Different child rules never share authorization merely because SANs overlap.
- Same-rule coalescing passes normal Firefox checks and current candidate-origin policy.
- No-rule-to-protected coalescing cannot skip certificate evaluation.

**Tests**

- C-31/C-32 across H2 and H3, private windows and containers.
- Certificates spanning public, protected and stricter child origins.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-025: Make HTTP2 and HTTP3 coalescing origin-policy aware. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-026 Bind resumption to current policy and authorization lifetime

Prevent tickets from preserving removed or expired authority.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-018, FDT-024, FDT-025. Chrome references: NET-06, TST-07.
Invariants: F4, F5, F8, F11. Experiments: FDE-05, FDE-06.

**Deliverables**

- Initial protected-resumption disablement and subsequent metadata-bound implementation.
- Ticket invalidation for rule, certificate, revocation and trust changes.

**Acceptance criteria**

- Old tickets cannot resume after new protection, anchor removal, restart or policy expiry.
- Same-generation certificate expiry cannot retain admission.
- Unknown or missing ticket metadata causes full verification rather than policy bypass.

**Tests**

- TLS1.2/TLS1.3 and QUIC ticket matrix on supported configurations.
- Restart persistence, current-policy reuse, expiry without update and trust-store changes.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-026: Bind resumption to current policy and authorization lifetime. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-027 Gate early data and TLS application-data shortcuts

Ensure the no-disclosure property includes 0-RTT and any False Start path.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-003, FDT-024, FDT-026. Chrome references: NET-07, TST-07.
Invariants: F1, F8, F11. Experiments: FDE-05.

**Deliverables**

- Protected-origin 0-RTT prohibition.
- Authorization prerequisite for any early application-data path identified in intake.

**Acceptance criteria**

- Protected requests never use early data before current authorization.
- Rejected early-data retries still run the normal gate.
- Unmatched behavior remains baseline where origin isolation is established.

**Tests**

- Resumed H3/TLS with attempted early cookies and POST canaries.
- Policy change between ticket issuance and use; False Start instrumentation where supported.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-027: Gate early data and TLS application-data shortcuts. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-028 Implement atomic policy activation across processes

Define a single observable cutover for all affected network admissions.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-010, FDT-018, FDT-024, FDT-025, FDT-026, FDT-027. Chrome references: POL-07, NET-05, TST-08.
Invariants: F5, F8, F9, F11, F12. Experiments: FDE-05, FDE-06.

**Deliverables**

- Admission-freeze, durable candidate, generation publication, invalidation and acknowledgment protocol.
- Timeout and failed-process recovery behavior.

**Acceptance criteria**

- Activation acknowledgment follows all required enforcement acknowledgments.
- Stalled processes cannot continue affected admissions.
- Loosening or unrelated changes do not unnecessarily disconnect the entire browser.

**Tests**

- Forced IPC delay, crash at each phase and verification/update races.
- Large concurrent H1/H2/H3 traffic with cutover timestamps and server canaries.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-028: Implement atomic policy activation across processes. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-029 Handle policy certificate and authorization expiry on live sessions

Prevent long-lived connections from outliving their permitted authority.

Milestone: M3. Owner: network. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-026, FDT-028. Chrome references: NET-05, NET-06, CFG-08.
Invariants: F4, F8, F11, F12. Experiments: FDE-05, FDE-06, FDE-09.

**Deliverables**

- Expiry timers and admission-time checks.
- Emergency session closure and sleep/wake revalidation.

**Acceptance criteria**

- Policy and certificate expiry block further affected admission without requiring a new handshake.
- Emergency removal retires every known affected session and ticket.
- Time uncertainty and clock rollback follow the documented protected fail-closed state.

**Tests**

- Long-lived WebSocket/H3 streams, sleep/resume and clock manipulation.
- No-generation-change expiry with pending and pooled requests.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-029: Handle policy certificate and authorization expiry on live sessions. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-030 Invalidate affected cached documents and worker execution

Prevent old content from being presented as newly verified after protection changes.

Milestone: M3. Owner: gecko. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-019, FDT-024, FDT-028, FDT-029. Chrome references: TST-06, TST-07, NET-05.
Invariants: F5, F8, F11, F12. Experiments: FDE-11.

**Deliverables**

- Origin-scoped HTTP cache, BFCache, service-worker and document transition plan.
- Explicit separation of connection authorization and historical content provenance.

**Acceptance criteria**

- Newly protected/tightened origins cannot restore a stale verified badge or run background requests under old authorization.
- Affected execution is stopped or quarantined before activation completes.
- Cookies and user data are not silently deleted to substitute for admission enforcement.

**Tests**

- New protection with populated cache, BFCache restore, CacheStorage and active service workers.
- Offline mode, open tabs, background fetch and browser restart.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-030: Invalidate affected cached documents and worker execution. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-031 Qualify browser surfaces and context isolation

Verify enforcement across the declared desktop browser surface.

Milestone: M3. Owner: qualification. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-006, FDT-023, FDT-025, FDT-027, FDT-029, FDT-030. Chrome references: TST-06, TST-07.
Invariants: F1, F5, F6, F8, F11, F12. Experiments: FDE-11.

**Deliverables**

- FDE-11 results for frames, fetch, workers, downloads, WSS, WebTransport and speculation.
- Private-window, container, session-restore and managed-startup matrix.

**Acceptance criteria**

- Every advertised surface has real browser evidence or an enforced protected block.
- Failed or skipped tests are not counted as passes.
- Extension observation coverage is reported independently of native coverage.

**Tests**

- Cross-origin and nested-frame requests with synthetic credentials.
- Warm and cold contexts, startup and process restart.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-031: Qualify browser surfaces and context isolation. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-032 Qualify OS roots and private PKI over HTTP3

Establish platform-specific trust and protocol compatibility.

Milestone: M3. Owner: qualification. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-020, FDT-025, FDT-026, FDT-031. Chrome references: TST-05, TST-09, NET-01.
Invariants: F1, F4, F6, F7. Experiments: FDE-07.

**Deliverables**

- Linux NSS/enterprise and macOS managed platform-root configuration results.
- Baseline versus fork certificate and actual H3 negotiation matrix.

**Acceptance criteria**

- Unmatched legitimate private roots retain certificate acceptance; arbitrary unknown roots fail.
- Protected unapproved enterprise/interception roots fail.
- Any changed protocol-selection heuristic is documented separately from certificate equivalence.

**Tests**

- C-10–C-17, C-27–C-29 and C-43–C-46 on each advertised architecture.
- Explicit proxy environments and root-store updates.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-032: Qualify OS roots and private PKI over HTTP3. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-033 Implement signed bundle verification and signer separation

Authenticate policy content independently from its transport and CA keys.

Milestone: M4. Owner: policy. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-009, FDT-010, FDT-011, FDT-012. Chrome references: CFG-01, CFG-02.
Invariants: F4, F9, F10, F12. Experiments: FDE-06, FDE-12.

**Deliverables**

- Canonical signed envelope, bounded decoder and required-feature checks.
- Policy signer, recovery root and key-epoch validation.

**Acceptance criteria**

- Bad signatures, duplicate fields, unsupported critical features and out-of-scope signers are rejected.
- A TLS CA signature alone cannot authorize a browser-policy change.
- The production parser has no hidden permissive test mode.

**Tests**

- Tampered/truncated/oversized payloads, duplicate-key encodings and algorithm confusion.
- Root/online key separation and same-generation equivocation.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-033: Implement signed bundle verification and signer separation. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-034 Persist rollback floors and unexpired last-known-good state

Keep restart and storage failures from erasing policy protection.

Milestone: M4. Owner: policy. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-010, FDT-028, FDT-029, FDT-033. Chrome references: CFG-03, TST-08.
Invariants: F8, F9, F12. Experiments: FDE-06.

**Deliverables**

- Crash-consistent payload/epoch storage and enrolled-scope inventory.
- Recovery state machine with explicit managed-profile assumptions.

**Acceptance criteria**

- Replay and corruption cannot reset the known generation floor.
- Expired last-known-good data retains protected scope but supplies no expired authorization.
- Whole-endpoint administrator rollback is not falsely claimed prevented by profile files.

**Tests**

- Crash at each persistence boundary and restore older payloads.
- Delete/corrupt profile cache, recreate profile, time rollback and first boot.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-034: Persist rollback floors and unexpired last-known-good state. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-035 Integrate authenticated asynchronous policy distribution

Update policies without fetching trust decisions inside the handshake.

Milestone: M4. Owner: policy. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-028, FDT-033, FDT-034. Chrome references: CFG-04, POL-06, TST-08.
Invariants: F9, F12. Experiments: FDE-06, FDE-09.

**Deliverables**

- Background updater with bounded retries, endpoint controls and independently authenticated payloads.
- Signed staged activation and update-health events.

**Acceptance criteria**

- Policy refresh failure uses only unexpired last-known-good state.
- No arbitrary site-origin request can invoke a general updater bypass.
- Recovery traffic uses its dedicated authenticated path without disabling browsing enforcement.

**Tests**

- Mirror compromise, HTTPS interception, outage and expired snapshot.
- Policy endpoint in protected scope and recovery from expired policy.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-035: Integrate authenticated asynchronous policy distribution. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-036 Integrate the shared controller and cross-browser policy compiler

Produce semantically consistent Chrome and Firefox policies from governed inputs.

Milestone: M4. Owner: controller. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-001, FDT-009, FDT-033, FDT-035. Chrome references: CFG-05, POL-01.
Invariants: F2, F9, F10. Experiments: FDE-09.

**Deliverables**

- Resolved reuse plan for existing controller code.
- Deterministic compiler, feature negotiation and approval records.

**Acceptance criteria**

- Both browsers consume equivalent authority/rule semantics or reject unsupported features.
- A compiler change cannot silently omit a restriction on one browser.
- Signed output and source approval are traceable without disclosing private signing keys.

**Tests**

- Golden compiler vectors and browser compatibility matrix.
- Recompile identical governed inputs and compare unsigned payloads.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-036: Integrate the shared controller and cross-browser policy compiler. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-037 Implement authorized domain onboarding and constrained delegation

Permit tenant policies only within their authorized namespace and powers.

Milestone: M4. Owner: controller. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-011, FDT-033, FDT-036. Chrome references: CFG-09, CFG-10, POL-05.
Invariants: F2, F4, F9, F10, F12. Experiments: FDE-09.

**Deliverables**

- DNS-control and CA-possession evidence workflow.
- Scoped delegation, threshold/approval rules, expiry and signed scope-release semantics.

**Acceptance criteria**

- A child key cannot change parent, sibling, enforcement floor or longer validity.
- DNS proof or old-CA possession alone cannot change governance authority.
- Explicit scope removal cannot be synthesized from absence or expiry.

**Tests**

- Valid child, sibling escape, expired delegate and parent downgrade attempts.
- Public-suffix onboarding, delegation depth and key-compromise recovery.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-037: Implement authorized domain onboarding and constrained delegation. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-038 Implement old and new CA overlap and application version coexistence

Rotate CA keys while keeping allowed software slots operational.

Milestone: M4. Owner: controller. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-029, FDT-035, FDT-036, FDT-037. Chrome references: CFG-06, CFG-07, NET-05.
Invariants: F8, F9, F10, F12. Experiments: FDE-09.

**Deliverables**

- Current-authority approval and next-key-possession records.
- Publish/adopt/switch/remove workflow and active-client readiness report.

**Acceptance criteria**

- Old and new authorized CAs work only during the approved overlap.
- Removal invalidates old sessions and tickets; offline clients fail safely.
- Application A/B rollback uses current certificate/policy authority and never rolls back browser generation.

**Tests**

- C-34/C-49 and FDE-09 overlap, offline and slow-client cases.
- Separate service-certificate expiry, policy expiry and application-slot changes.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-038: Implement old and new CA overlap and application version coexistence. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-039 Implement emergency revocation and root-authorized recovery

Remove compromised authority without opening an enforcement bypass.

Milestone: M4. Owner: controller. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-029, FDT-034, FDT-035, FDT-037, FDT-038. Chrome references: CFG-08, CFG-03, NET-05.
Invariants: F4, F8, F9, F10, F12. Experiments: FDE-06, FDE-09.

**Deliverables**

- Emergency SPKI deny workflow, epoch transition and recovery package.
- Measured issuance-to-activation and session-retirement events.

**Acceptance criteria**

- A revoked key is not resurrected through overlap or stale signed bundles.
- Recovery obeys the independent root/threshold policy.
- No guarantee of instantaneous offline revocation is claimed.

**Tests**

- C-35/C-50, replay after recovery and concurrent application traffic.
- Expired online signer and authorized recovery with outage.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-039: Implement emergency revocation and root-authorized recovery. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-040 Add policy audit history and fleet health integration

Make policy adoption and authorized changes operationally visible.

Milestone: M4. Owner: controller. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-019, FDT-035, FDT-036, FDT-039. Chrome references: CFG-11, CFG-12, POL-08.
Invariants: F5, F9, F10. Experiments: FDE-09.

**Deliverables**

- Append-only change history with payload digest and approval linkage.
- Build/generation/expiry/last-update health and aggregate failure counters.

**Acceptance criteria**

- Every distributed generation maps to an approved payload.
- Offline and inactive devices are excluded from active-adoption denominators explicitly.
- No browsing URLs, cookies or page content are required for fleet health.

**Tests**

- Unauthorized audit edits and missing approval detection.
- Clock-skewed clients, offline cohorts and telemetry redaction.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-040: Add policy audit history and fleet health integration. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-041 Qualify full policy lifecycle across both browser adapters

Demonstrate dynamic operation without weakening inherited constraints.

Milestone: M4. Owner: qualification. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-032, FDT-034, FDT-035, FDT-038, FDT-039, FDT-040. Chrome references: TST-08, CFG-07, CFG-10.
Invariants: F8, F9, F10, F11, F12. Experiments: FDE-05, FDE-06, FDE-09.

**Deliverables**

- FDE-05/FDE-06/FDE-09 lifecycle evidence.
- Cross-browser result comparison or explicit unavailable-Chrome status.

**Acceptance criteria**

- Every lifecycle case has actual pass/fail/blocked status.
- Signed candidate failures never replace a valid snapshot.
- Expiry, rollback, delegation and emergency removal satisfy the declared cutover contract.

**Tests**

- C-33–C-39 and C-47–C-50 with real browsers.
- Power loss, IPC interruption, sleep/wake and overlapping traffic.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-041: Qualify full policy lifecycle across both browser adapters. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-042 Build pinned Linux and macOS product packages

Create separately identifiable native browser artifacts for every advertised platform.

Milestone: M5. Owner: release. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-001, FDT-032, FDT-041. Chrome references: FORK-02, FORK-03, FORK-05, FORK-06, FORK-07, FORK-08, FORK-10.
Invariants: F5, F9, F12. Experiments: FDE-07, FDE-10.

**Deliverables**

- Versioned patch stack, clean builds, package recipes and runtime bootstrap.
- Unsigned reproducibility comparison, SBOM and provenance; signed/notarized macOS package where applicable.

**Acceptance criteria**

- Packaged binaries include the actual verifier changes and match recorded commits.
- Product/profile/update identity is distinct from stock Firefox.
- Each advertised architecture has install and trust-matrix evidence; missing runners remain blocked.

**Tests**

- Clean build on independent workers; compare unsigned payloads and explain nondeterminism.
- Install, launch, default-profile bootstrap and signature verification.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-042: Build pinned Linux and macOS product packages. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-043 Provide CI gates and authenticated product updates

Keep native security tests and signed release delivery mandatory.

Milestone: M5. Owner: release. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-017, FDT-031, FDT-032, FDT-041, FDT-042. Chrome references: FORK-09, FORK-10, TST-05, TST-06, TST-08.
Invariants: F6, F8, F9, F12. Experiments: FDE-10.

**Deliverables**

- Focused patch CI, scheduled H1/H2/H3 suite and full release matrix.
- Staged authenticated update channels with build and policy compatibility checks.

**Acceptance criteria**

- No artifact-only build or ignored native test failure can qualify a release.
- Browser rollback cannot select a version lacking required enforcement capabilities.
- Security-sensitive tests never disable certificate verification to make endpoints work.

**Tests**

- Tampered update, interrupted installation, stale compatible/incompatible builds.
- Verify scheduled jobs assert actual H3 and classify unavailable runners.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-043: Provide CI gates and authenticated product updates. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-044 Add fuzzing differential and fail-open mutation testing

Exercise hostile input and prove the suite detects deliberate enforcement defects.

Milestone: M5. Owner: qualification. Priority: P0. Status: planned. Execution: codex.
Dependencies: FDT-015, FDT-018, FDT-028, FDT-033, FDT-034, FDT-041. Chrome references: TST-10, VER-12.
Invariants: F1, F3, F4, F8, F9, F11, F12. Experiments: FDE-12.

**Deliverables**

- Policy/DER-boundary/IPC fuzz targets and persisted regression corpus.
- Differential unmatched checks and seeded fail-open mutations.

**Acceptance criteria**

- Seeded no-rule fallback, skipped generation gate, private-root relabel and WebTransport bypass are detected.
- Parser failures remain bounded and cannot replace the active snapshot.
- Cross-browser differences are classified by intended platform semantics.

**Tests**

- Sanitizer fuzz campaigns and reproducible crash artifacts.
- Mutation runs with expected failing security tests.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-044: Add fuzzing differential and fail-open mutation testing. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-045 Run paired performance and scale experiments

Measure real cost for protected and ordinary browsing without hiding feature differences.

Milestone: M5. Owner: qualification. Priority: P1. Status: planned. Execution: hybrid.
Dependencies: FDT-025, FDT-026, FDT-032, FDT-041, FDT-042. Chrome references: VER-11.
Invariants: F1, F6, F7, F8. Experiments: FDE-08.

**Deliverables**

- FDE-08 raw observations and analysis scripts.
- Rule/anchor scale, handshake, page-load, throughput, memory and update-stall results.

**Acceptance criteria**

- Control and treatment use identical baseline, hardware, trust and network configuration.
- Results separate cold/warm, H2/H3, protected/unmatched and early-data profiles.
- All proposed budgets are labelled targets until measured with uncertainty estimates.

**Tests**

- Randomized paired runs with at least 30 independent process starts per main scenario initially.
- Raptor/Browsertime-compatible workloads and isolated verifier microbenchmarks.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-045: Run paired performance and scale experiments. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-046 Execute all inherited conformance and new Firefox cases

Produce the release evidence matrix against the Chrome compatibility contract.

Milestone: M5. Owner: qualification. Priority: P0. Status: planned. Execution: hybrid.
Dependencies: FDT-031, FDT-032, FDT-041, FDT-043, FDT-044, FDT-045. Chrome references: TST-01, TST-02, TST-03, TST-04, TST-05, TST-06, TST-07, TST-08, TST-09, TST-10.
Invariants: F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12. Experiments: FDE-01, FDE-02, FDE-03, FDE-04, FDE-05, FDE-06, FDE-07, FDE-08, FDE-09, FDE-11, FDE-12.

**Deliverables**

- C-01–C-50 translated expectations with original meaning retained.
- FDE-01–FDE-12 result index and explicit Firefox-specific cases.

**Acceptance criteria**

- Each inherited case has a result for every required platform/transport or a blocking reason.
- Mocks, skips, unsupported tests and absent Chrome builds are not reported as equivalent passes.
- Zero protected-data disclosure failures and zero unexplained unmatched acceptance differences.

**Tests**

- Full deterministic matrix and selected real-browser canary repeats.
- Validate evidence links, missing measurements and baseline digests.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-046: Execute all inherited conformance and new Firefox cases. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-047 Evaluate rebases and define continuing security maintenance

Measure whether the fork can follow upstream security releases reliably.

Milestone: M5. Owner: release. Priority: P1. Status: planned. Execution: hybrid.
Dependencies: FDT-042, FDT-043, FDT-046. Chrome references: FORK-04, FORK-12, VER-12.
Invariants: F3, F4, F6, F8, F9. Experiments: FDE-10.

**Deliverables**

- Two subsequent security-update rebase records with conflict and review effort.
- Named maintenance ownership, patch review map and release response objective.

**Acceptance criteria**

- Every changed verifier/network seam is reviewed and its tests rerun.
- Lead time is measured from authoritative upstream availability to qualified package.
- Two rebases are reported as sampled evidence, not indefinite maintenance proof.

**Tests**

- Patch application, full native build and focused security regression on each rebase.
- Emergency update rehearsal with signed delivery and old-client compatibility.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-047: Evaluate rebases and define continuing security maintenance. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.

## FDT-048 Perform independent security review and publish qualification

Make the release claim no stronger than the available implementation and evidence.

Milestone: M5. Owner: architecture. Priority: P0. Status: planned. Execution: independent_review.
Dependencies: FDT-008, FDT-046, FDT-047. Chrome references: VER-12, FORK-10, TST-10.
Invariants: F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12. Experiments: FDE-01, FDE-02, FDE-04, FDE-05, FDE-06, FDE-10, FDE-12.

**Deliverables**

- Independent review of threat model, trust adapter, IPC, admission, updater and alternative authentication.
- Qualification report with platform/surface scope, measurements and remaining issues.

**Acceptance criteria**

- All mandatory findings are resolved or block the affected claim.
- Every invariant is linked to code, tests, experiment results and reviewer judgment.
- Final documentation distinguishes native enforcement, add-on observation and CA-attestation assumptions.

**Tests**

- Independent security assessment and evidence audit.
- Reproduce a sample of no-disclosure, rollback, WebTransport and expiry tests from release artifacts.

**Completion evidence**

- Actual source commit and patch identifiers; resolved repository and baseline digest.
- Commands, exit status, test artifacts and evidence digests; explicitly identify mocks versus real browser runs.
- Updated design and traceability; independent review record where required; unresolved gates remain blocked.

**Codex prompt**

Read CODEX_START.md, firefox-domain-trust-report.md and the repository AGENTS.md. Resolve the actual owner repository and dependencies. Implement FDT-048: Perform independent security review and publish qualification. Reuse verified existing code, preserve the listed invariants, and meet every acceptance criterion. Run the listed meaningful tests, record actual evidence, and update documentation and task status. Do not claim browser or platform qualification from mocks, insecure-certificate test modes, skipped tests, or unexecuted experiments.
