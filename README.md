# Phishing Website Detection Using Deep Learning

A Deep Neural Network (DNN)-based classifier for detecting phishing websites using the Kaggle dataset:

Web Page Phishing Detection Dataset
https://www.kaggle.com/datasets/shashwatwork/web-page-phishing-detection-dataset

This repository provides:
 * Automated dataset download (Kaggle API)
 * Full preprocessing pipeline
 * Deep Learning model (PyTorch)
 * Evaluation metrics
 * Ready-to-use Jupyter Notebook
 * Model saving + inference support

---

# Project Structure
```
phishing-detection/
│
├── data/                     # Dataset (auto-downloaded)
├── train.ipynb           # End-to-end notebook
│
├── scripts/
│   ├── download_dataset.sh   # Kaggle download script
│
├── requirements.txt
└── README.md
```


---

⚙️ Installation

> git clone https://github.com/<your-username>/phishing-detection.git

> cd phishing-detection

> pip install -r requirements.txt


---

# Kaggle API Setup
1.	Go to Kaggle → Account → Create API Token
2.	Download kaggle.json
3.	Place it in the project root (next to download_dataset.sh)

---

# Download Dataset

> chmod +x scripts/download_dataset.sh

> ./scripts/download_dataset.sh

This downloads the dataset into:

> data/*.csv


---

# Preprocessing Includes
*	One-Hot Encoding for low-cardinality categorical features
*	Frequency Encoding for high-cardinality features
*	StandardScaler for feature normalization
*	Isolation Forest for outlier removal
*	Stratified Train/Validation/Test split

---

# Model Architecture (DNN)
```
Input Layer (N features)
  ↓
Linear → BatchNorm → LeakyReLU → Dropout
  ↓
Linear → BatchNorm → LeakyReLU → Dropout
  ↓
Linear → BatchNorm → LeakyReLU → Dropout
  ↓
Output Layer (Sigmoid)
```

Key Features
 * Learns non-linear feature interactions
 * Robust to noise
 * Lightweight for real-time inference
 * Dropout + BatchNorm prevent overfitting

---

📊 Evaluation Metrics

The model reports:
 * Accuracy
 * Precision
 * Recall
 * F1 Score
 * Confusion Matrix

---

🚀 Inference API (Optional)

Run:

> python scripts/inference_api.py

Predict:

```
curl -X POST http://localhost:5000/predict \
    -H "Content-Type: application/json" \
    -d '{"URL_Length": 78, "Num_Subdomains": 3}'
```

---

# Algorithms Used
* Isolation Forest – Outlier removal
* One-Hot Encoding – Low-cardinality categorical encoding
* Frequency Encoding – High-cardinality category handling
* StandardScaler – Normalization
* Deep Neural Network – Main classifier
* LeakyReLU – Activation function
* Batch Normalization – Training stabilization
* Dropout – Regularization
* Adam Optimizer – Adaptive optimizer
* Binary Cross Entropy Loss – Classification loss
* Early Stopping – Prevent overfitting

---

# Dataset Citation

Web Page Phishing Detection Dataset
Kaggle — Shashwat Kumar
https://www.kaggle.com/datasets/shashwatwork/web-page-phishing-detection-dataset

---

# Future Work
	•	Use CNN/Transformer on raw URL strings
	•	Explainability using SHAP/LIME
	•	Cloud deployment (AWS/GCP)
	•	Browser extension integration

---