# L2-SMART: Adaptive Layer‑2 IOAM Telemetry Framework

This repository contains the full implementation, experiment scripts, and analysis tools used in the research paper:

**“L2‑SMART: Adaptive Layer‑2 IOAM Telemetry for Efficient Hop‑Level Observability.”**

The project implements:
- A **Layer‑2 IOAM P4 data plane** with custom metadata, hop, and extension headers  
- The **L2‑SMART adaptive telemetry algorithm** (sampling + event‑driven + hybrid)  
- A **Python control plane** for dynamic telemetry activation  
- A reproducible **BMv2 software‑switch testbed**  
- All scripts required to recreate the experiment described in the paper  

---
Citation
@inproceedings{l2smart2026,
  title={L2-SMART: Adaptive Layer-2 IOAM Telemetry for Efficient Hop-Level Observability},
  author={Swethashree et al.},
  year={2026},
  booktitle={IEEE Conference on XYZ},
}

---

## 📌 Features

- Hop‑accurate latency, jitter, and loss measurement at Layer‑2  
- Custom IOAM metadata, hop, and extension headers  
- Event‑driven telemetry activation based on:
  - Latency thresholds  
  - Jitter spikes  
  - Packet loss  
  - Queue depth  
- 70% overhead reduction compared to VPP‑IOAM  
- Near‑zero packet loss (~2%)  
- Fully reproducible experiment setup  

---

## 📁 Repository Structure
p4src/           # P4 program (Layer-2 IOAM + SMART)
controller/      # Python control plane + SMART algorithm
experiments/     # Topology setup, traffic generation, capture scripts
results/         # Sample outputs and analysis notebook
README.md        # Documentation
LICENSE          # MIT License


---

## 🧪 Experimental Testbed

The testbed replicates the environment described in the paper:
h1 --- s1 --- s2 --- s3 --- h2

- All switches are BMv2 `simple_switch` instances  
- Links are Linux veth pairs  
- IOAM uses EtherType `0x9000`  
- SMART runs at the ingress switch  
- Metadata is exported to a Python collector  

---

## 🚀 How to Run the Experiment

### 1. Install Dependencies

```bash
sudo apt install python3 python3-pip tcpdump
pip3 install scapy matplotlib numpy pandas

Install P4 toolchain:
```bash
git clone https://github.com/p4lang/p4c
git clone https://github.com/p4lang/behavioral-model

2. Compile the P4 Program
```bash
cd p4src
p4c --target bmv2 --arch v1model l2_smart_ioam.p4 -o build/

3. Create the Topology
```bash
cd experiments
sudo ./setup_topology.sh

4. Launch Switches
```bash
./run_switches.sh

5. Start the SMART Controller
```bash
cd controller
python3 smart_controller.py

6. Generate Traffic
```bash
cd experiments
./run_traffic.sh

7. Capture and Analyze
```bash
./capture.sh
python3 analyze.py










