### Migração e modernização do site estático da Vision Stays para a nuvem, incluindo novas funcionalidades.

---

#### **Requisitos**
**Vision Stays**, uma rede de hotéis, possui um site estático. O objetivo é:
1. Migrar o site para a OCI.
2. Adicionar funcionalidade de reservas online.
3. Integrar com sistemas de terceiros para consulta de disponibilidade de quartos.

---

### **Soluções em OCI**

#### 1. **Migração do Site Estático**
- **Compute Instance:** O site (HTML, CSS, JavaScript e mídia) será hospedado em uma máquina virtual da OCI, garantindo **escalabilidade** e **desempenho confiável**.
- **Load Balancer:** Gerenciar o tráfego de entrada, distribuindo-o entre as VMs, melhorando **disponibilidade**, **responsividade** e segurança com funcionalidades como **SSL** e roteamento baseado em conteúdo.
- **IAM Policies:** Configurar políticas de acesso para restringir permissões e proteger os recursos.

---

#### 2. **Modernização com Arquitetura de Microsserviços**
- **Desmembramento do Monólito:** Dividir o site em microsserviços independentes, melhorando a **agilidade** e **manutenibilidade**.
- **Serviços Utilizados:**
  - **OKE (Kubernetes):** Gerenciar microsserviços como containers, com provisionamento e escalabilidade automáticos.
  - **OCI Functions:** Executar código em eventos específicos de forma escalável e leve.
  - **OCI Container e Artifact Registry:** Armazenar imagens de containers e artefatos.
  - **API Gateway:** Facilitar comunicação entre microsserviços e sistemas externos com autenticação, autorização e controle de tráfego.
  - **Autonomous Database:** Banco de dados serverless para armazenamento de dados persistentes, com escalabilidade e gerenciamento automatizados.
  - **Web Application Firewall:** Proteger o site contra ameaças e vulnerabilidades.

---

#### 3. **Automação e Observabilidade**
- **DevOps Project e Resource Manager:** Automatizar desenvolvimento, deploy e provisionamento de infraestrutura com consistência e eficiência.
- **Service Mesh:** Facilitar comunicação entre microsserviços, melhorando confiabilidade e observabilidade.
- **Core OCI Services:**
  - **Logging e Notifications:** Monitorar e notificar eventos críticos.
  - **OCI Vault:** Gerenciar segredos e dados sensíveis com segurança.

---

**Conclusão:**  
A abordagem cloud native na OCI oferece uma solução completa para modernizar o site da Vision Stays, otimizando performance, segurança e escalabilidade.