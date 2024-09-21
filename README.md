# Generative Image with Imagen3 on VertexAI | AI Image Generator

### **Overview**

This repository contains a Python application that leverages advanced AI models to perform various image-related tasks. It integrates models like [Imagen3, Imagen2 on VertexAI](https://cloud.google.com/vertex-ai/generative-ai/docs/image/overview), [Ollama](https://ollama.com/), and [Gemma](https://ollama.com/library/gemma2) to provide functionalities such as image generation, captioning, question answering, editing, and interactive dialogue. 

### **Key Features**

* **Image Generation:** 
    * Create new images using the Imagen3 model on Vertex AI.
    * Generate images based on text prompts.
* **Image Captioning:** 
    * Obtain descriptive text for images using visual captioning techniques.
* **Visual Question Answering (VQA):** 
    * Answer questions about images using the power of VQA models.
* **Image Editing:** 
    * Modify images based on text prompts using Imagen2.
* **Image-Based Dialogue:** 
    * Upload an image and engage in a conversation with the image using Ollama and Gemma.
* **Dockerization:** 
    * Dockerfiles provided for deploying the application and models to cloud platforms like Cloud Run.
* **User Interface:** 
    * A user-friendly interface built with Gradio for easy interaction.

### **Technologies Used**

* **Python:** The primary programming language for the application.
* **Imagen3 and Imagen2:** Advanced AI image generation and editing models.
* **Gradio:** Gradio is the fastest way to demo your machine learning model with a friendly web interface so that anyone can use it, anywhere!
* **Ollama:** Get up and running with large language models.
* **Gemma:** These models are designed to be lightweight and efficient, making them suitable for a variety of natural language processing tasks

### **Usage**

The Gradio interface will provide a user-friendly way to interact with the application. You can:

* Generate images based on text prompts
![Screenshot 2024-09-17 at 7 00 46 p m](https://github.com/user-attachments/assets/f141bf4f-d16a-4d7e-8107-84956a982886)

* Upload images for captioning and question answering
![Screenshot 2024-09-17 at 7 03 07 p m](https://github.com/user-attachments/assets/51075285-f4ce-499f-b0ee-22c44ace6e7d)

* Editing images based on text prompts
![Screenshot 2024-09-17 at 6 59 32 p m](https://github.com/user-attachments/assets/66e09b2d-0dd6-4b96-b1da-8ee5ae66ab29)

* Engage in conversations with images
![Screenshot 2024-09-17 at 7 03 27 p m](https://github.com/user-attachments/assets/ff001be3-fe14-48ec-b09d-25b6d32b7f14)


### **Cloud Run Deployment**

* **Build the Docker Image:**
   ```bash
   gcloud builds submit --region=us-central1 --tag gcr.io/devhack-3f0c2/ollama-server --machine-type e2-highcpu-32
   gcloud builds submit --region=us-central1 --tag gcr.io/devhack-3f0c2/generativeimages
   ```
   
* **Deploy to Cloud Run:**
  ```bash
  gcloud run deploy ollama-gemma --image=gcr.io/devhack-3f0c2/ollama-server --concurrency 4 --cpu 2 --set-env-vars OLLAMA_NUM_PARALLEL=4 --max-instances 7 --memory 8Gi --no-allow-unauthenticated --no-cpu-throttling --timeout=600 --region=us-central1 --platform managed
  gcloud run deploy generativeimages --image=gcr.io/devhack-3f0c2/generativeimages --region=us-central1 --platform managed
  ```

**Note:** Ensure you have the API keys and configurations for the cloud platform and AI services.

Made with ❤ by  [jggomez](https://devhack.co).

[![Twitter Badge](https://img.shields.io/badge/-@jggomezt-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/jggomezt)](https://twitter.com/jggomezt)
[![Linkedin Badge](https://img.shields.io/badge/-jggomezt-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/jggomezt/)](https://www.linkedin.com/in/jggomezt/)
[![Medium Badge](https://img.shields.io/badge/-@jggomezt-03a57a?style=flat-square&labelColor=000000&logo=Medium&link=https://medium.com/@jggomezt)](https://medium.com/@jggomezt)

## License

    Copyright 2024 Juan Guillermo Gómez

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
