# Research Report: Common Network Security Threats & Mitigations

## Introduction
In the contemporary digital landscape, network security is not merely an IT operational concern but a critical foundation of business continuity and data integrity. As organizational infrastructures increasingly rely on interconnected web services and distributed architectures, the attack surface has expanded exponentially. Threat actors continuously evolve their methodologies to compromise the confidentiality, integrity, and availability (CIA triad) of network data. This report analyzes four pervasive network security threats, examining their mechanisms, real-world impacts, and the specific strategic mitigations required to defend against them.

---

## 1. DoS/DDoS Attacks (Denial of Service / Distributed Denial of Service)
**How it Works:** A DoS attack attempts to exhaust a network, service, or server's resources so that legitimate users cannot access it. A DDoS attack amplifies this by utilizing a massive botnet of compromised devices to flood the target with superfluous traffic (e.g., HTTP floods, SYN floods), overwhelming the network bandwidth or processing capacity.

**Real-World Example:** The 2018 GitHub DDoS attack. GitHub was hit with 1.35 terabits per second of traffic, utilizing a Memcached amplification vulnerability. 
**Impact:** Complete service unavailability, severe financial losses due to downtime, and reputational damage.

**Mitigation Strategies:**
1. **Anycast Network Routing:** Distributes incoming traffic across multiple distributed servers to absorb and disperse the volume of a DDoS attack.
2. **Rate Limiting:** Restricts the number of requests a server will accept from a single IP address within a specific timeframe.
3. **Web Application Firewalls (WAF):** Deployed at the network edge to inspect incoming HTTP traffic and filter out malicious requests before they reach the origin server.

---

## 2. Man-in-the-Middle (MITM) Attacks
**How it Works:** An attacker secretly intercepts, relays, and possibly alters the communication between two parties who believe they are directly communicating with each other. This is often achieved through ARP spoofing on local networks or exploiting compromised public Wi-Fi access points.

**Real-World Example:** The 2015 Superfish scandal, where Lenovo pre-installed adware that intercepted encrypted web traffic by installing a self-signed root certificate, leaving users vulnerable to MITM attacks.
**Impact:** Theft of sensitive credentials, session hijacking, and the loss of data confidentiality and integrity.

**Mitigation Strategies:**
1. **Enforce HTTPS / TLS:** Ensure all data in transit is encrypted using strong cryptographic protocols (TLS 1.2 or 1.3).
2. **Certificate Pinning:** Hardcode the legitimate server’s SSL certificate fingerprint into the application to prevent attackers from using forged certificates.
3. **Virtual Private Networks (VPN):** Use encrypted VPN tunnels to secure traffic, especially when operating on untrusted public networks.

---

## 3. IP Spoofing
**How it Works:** The attacker creates Internet Protocol (IP) packets with a forged source IP address to conceal their identity or impersonate a trusted computing system. This is often used to bypass IP-based authentication or to reflect DDoS traffic toward a victim.

**Real-World Example:** The 2020 AWS DDoS attack, which peaked at 2.3 Tbps, relied heavily on spoofed IP addresses exploiting Connectionless Lightweight Directory Access Protocol (CLDAP) servers for reflection.
**Impact:** Unauthorized network access, evasion of tracebacks during cyberattacks, and massive DDoS amplification.

**Mitigation Strategies:**
1. **Ingress/Egress Filtering:** Implement router filters (BCP 38) to drop packets entering or leaving the network if their source IP addresses do not match the expected logical IP ranges.
2. **IPsec (Internet Protocol Security):** Utilize IPsec to authenticate and encrypt every IP packet in a communication session, rendering spoofed packets invalid.
3. **Deep Packet Inspection (DPI):** Analyze the payload and header of network packets to detect anomalies indicating spoofing.

---

## 4. DNS Poisoning / Spoofing (Bonus Threat)
**How it Works:** Attackers corrupt the Domain Name System (DNS) resolver cache, replacing the legitimate IP address of a website with a malicious one. When users attempt to navigate to a legitimate domain, they are secretly redirected to the attacker's fraudulent server.

**Real-World Example:** The 2018 MyEtherWallet attack, where attackers hijacked BGP routes and poisoned DNS servers to redirect cryptocurrency users to a fake phishing site, resulting in the theft of thousands of dollars in Ethereum.
**Impact:** Widespread phishing credential theft, malware distribution, and loss of user trust.

**Mitigation Strategies:**
1. **DNSSEC (DNS Security Extensions):** Adds cryptographic signatures to DNS records, ensuring that the DNS response has not been tampered with.
2. **DNS over HTTPS (DoH):** Encrypts DNS queries to prevent attackers from reading or manipulating the DNS requests in transit.
3. **Short TTL (Time to Live):** Reduce the TTL for sensitive DNS records so that if a cache is poisoned, the malicious entry expires quickly.

---

## Threat Comparison Matrix

| Threat Type | Primary Attack Vector | Who is at Risk? | Difficulty to Execute | Ease of Mitigation |
|---|---|---|---|---|
| **DDoS** | Botnets, Amplification | Any public-facing service | Low (Botnets are rentable) | Hard (Requires massive infrastructure) |
| **MITM** | Local network, Wi-Fi | End-users, Internal networks | Medium | Easy (Enforce TLS/HTTPS) |
| **IP Spoofing** | Forged packet headers | Network perimeters, APIs | Medium | Medium (Requires ISP/Router configs) |
| **DNS Poisoning** | DNS resolver caches | End-users, Web platforms | High | Medium (Deploy DNSSEC) |

---

## Conclusion: Key Takeaways for Network Administrators
1. **Assume a Hostile Environment:** Implement Zero Trust principles; never rely solely on IP addresses for authentication due to spoofing risks.
2. **Encryption is Non-Negotiable:** Both data in transit (TLS/HTTPS) and DNS queries (DoH) must be encrypted to defend against interception and manipulation.
3. **Defense in Depth:** Perimeter firewalls are insufficient on their own. Administrators must combine edge protection (WAF, Anycast) with internal safeguards (Certificate Pinning, Ingress Filtering) to create a resilient architecture.

---

## References
1. **NIST (National Institute of Standards and Technology).** (2020). *Guide to General Server Security* (SP 800-123). https://csrc.nist.gov/
2. **CISA (Cybersecurity and Infrastructure Security Agency).** (2022). *Understanding Denial-of-Service Attacks*. https://www.cisa.gov/
3. **MITRE ATT&CK Framework.** (2023). *Techniques: Adversary-in-the-Middle (T1557)*. https://attack.mitre.org/
4. **SANS Institute.** (2019). *Defeating the Man-in-the-Middle*. SANS Reading Room. https://www.sans.org/
