# Student Research Guidelines

So you wanna write a thesis at our chair.
Here's how to do it.

## General

The thesis is the final step of your studies.
As such, we expect you to self organize and self manage your thesis.
We stand by as your advisors, and will thus *advise* you in your thesis;
yet, writing a successful thesis is **your responsibility**!

If you follow these rules and put in the necessary work, you surely will do well! :^)

**Disclaimer.** We strongly recommend reading the `Modulbeschreibung` of the thesis and your `Pruefungsordnung`.
Both of these documents contain the *legally binding* information regarding the modularities of your thesis.

You may find your Study and Exam Regulations [here](https://tu-dresden.de/ing/informatik/studium/examination-office).

## **Step 0.** Preparing your Thesis Topic

Initially, you will have one or a few meetings with Prof. Fetzer and your possible advisor regarding your thesis topic.
We expect that you will have read and prepared the applicable topic description before, if one was given on the website.
In the meeting, the professor and the advisor will discuss the topic with you.
Please *take notes* and review the meeting afterwards.

### **OPTIONAL Step 0.1.** Write an Expose

> When writing, please refer to the writing style section <!-- TODO -->

In context of thesis preparation, we strongly recommend you write an expose after your initial meetings;
the expose will help you:
- Understand the problem
- Cover up things unclear with the problem
- Show us how (and if) you understand the problem
- Create a "problem contract" by setting a concrete scope of your thesis
- Give you an opportunity to practice your writing, reviewed by your adivsor

Alternatively, your advisor may ask you to prepare a presentation instead.

The structure of the expose should look as follows:
1. **Introduction**

- Sets the context of the thesis
- Motivates the initial problem or research question
    - For motivation, you may possibly refer to related works
- States the explicit problem which your work is to address

2. **Problem Statement**

- Describe the aim of your work, relating to the previously stated problem
- Give an overview of your work's approach (solution design) to the problem
    - Use a figure!
- Include all work's aspects previously discussed in meetings with the professor and the advisor

3. **Challenges**

During your previous meetings, a few research challenges will arise.
These challenges form the *novelty of your work*, and will be the core points your design must address.
- State all the challenges previously discussed
- Give a short statement regarding your design's approach to each corresponding challenge

4. **Research Context (Related Work)**

Research and read through related works to contextualize your thesis in the current research landscape.
This context also serves to motivate your own research.
Contents (2-3 sentences per related work item):
- describes author's work in one sentence
- how does this work relate to your work?
- how does you work differ from this work?

**Examples.**
- [Multi-process File-system Shield](examples/exposé/multi-process-fss.md)
- [Console Shield](examples/exposé/stdx-shield.md)
- [Confidential K8s Api Proxy](examples/exposé/confidential-k8s-api-proxy.pdf)

## **Step 1.** Register

> Please check the current 'How-to-Thesis' rules on [the examination office's website](https://tu-dresden.de/ing/informatik/studium/examination-office/faqs?set_language=en).
> These guidelines may be out of date!

To have your thesis contribute towards your graduation, you will need to of course register your thesis.
Please note, **you need to register the thesis yourself**.
We will not register the thesis for you.
To register the thesis, you currently (04.04.2025) need to follow these steps:
1. Fill out [thesis registration form](https://tu-dresden.de/ing/informatik/ressourcen/dateien/pruefungsamt/formulare-neu9/Formular-Anmeldung-Abschlussarbeit.pdf?lang=de) ; don't sign it yet!
> You will need to specify Prof. Christof Fetzer and ~~Dr. Andre Martin~~ Dr. K. Pubudu N. Jayasena as the first and second examiner, respectively.
2. You send the filled out form to your advisor.
3. Your advisor collects the signatures of Prof. Fetzer and ~~Dr. Martin~~ Dr. K. Pubudu N. Jayasena and returns the form to you.
4. You **phsyically** sign the form (i.e. with a ballpoint pen).
4. You send the form to the examination office (by post or in person).
5. You wait for the examination office to confirm the registration of your thesis.


## **Step 2.** Write your thesis

> This step is mostly based off of the [Microsoft How to write a great research paper](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/07/How-to-write-a-great-research-paper.pdf).
> Please read through the slides.

**Prerequisites**
- please use the [TUD thesis template](https://tu-dresden.de/ing/informatik/smt/cgv/studium/materialien?set_language=en)
- please use the [zih ShareTex](https://tex.zih.tu-dresden.de/) to share your thesis (it has to compile there!)

Importantly, the thesis should be telling one coherent story.
Ensure to keep a connecting thread throughout the thesis;
each chapter should serve a unique purpose, and interlock into the entire thesis context.

- Write your thesis and implement your work in parallel
    - Writing is thinking!
    If you do not write, you do not think.
    - Further, writing your thoughts into the structure of the thesis allows you to order your thoughts; you will then not lose track of them later on.
- Follow an *iterative* approach;
    - Begin by specifying a structure; refer to the examples for inspiration.
    For implementation-oriented theses, there is often a 'template' structure which you can re-use (**TODO:** reference).
    However, with different subject matter, a different structure may be useful.
    Note that the structure sets the base narrative for your entire thesis; the structure is the template into which you order your thoughts.
    As such, **take time to get the structure right**!
    - As you already have written your expose, you can start by writing your introduction.
    You should first sketch the section; begin by writing only topic sentences for every paragraph (see writing style).
    You can then leave the section as a sketch, as you may decide to change it later on.
    - Do the same for every section once you are qualified to write the corresponding section. I.e., once (and during research!) you have a full grasp of all concepts involved in your thesis, go ahead and sketch the background section.


### Examples

Here are some thesis and paper examples.
Papers are nevertheless useful as templates; papers are of course very compact, your thesis may spend more text on every section.

Sources marked with "template" offer a structure and style which I *personally* prefer. Other structures are very much possible, as shown by theses which are not marked as such.

Papers:
- [uIO Paper](./examples/papers/Misono et al. - 2024 - uIO Lightweight and Extensible Unikernels.pdf) (template)
- [vmSh Paper](./examples/papers/Thalheim et al. - 2022 - VMSH hypervisor-agnostic guest overlays for VMs.pdf) (template)

Theses:
- [cvm-io](./examples/theses/msc_scha_cvm-io_secure_high_performance_storage_stack_for_confidential_virtual_machines.pdf) (template)
- [legacy apps in aws nitro](./examples/theses/bsc_salame_towards_running_legacy_applications_inside_aws_nitro_type_enclaves.pdf)
- [out of spec compilation](./examples/theses/msc_paulhdk_out_of_spec_compilation_in_the_presence_of_dragons.pdf)
- [wasm memory safety](./examples/theses/msc_martin_fink_wasm_memory_safety.pdf)
- [network shield](./examples/theses/Thümmel - Implementation, Integration and Performance Evalua.pdf) (TUD chair template)


### Writing Style
- Each paragraph should contribute one core argument or statement, declared by the **topic sentence**.
    - The first sentence (topic sentence) of the paragraph states this core point; you can think of it as a declaration of the paragraph's point, whereas the rest of the paragraph serves as the argument supporting this core point

Example (bold sentence is the topic sentence):
> **In confidential compute, a process using the SCONE framework may protect the process's file system using the SCONE File System Shield (FSS).** The SCONE runtime transparently integrates the FSS, intercepting any system calls which access the file system. The process thereby stores protection data, e.g. encryption key and message authentication tags, in an in-memory File System Protection File (FSPF) local to the process.

- Write in **active voice**; not passive voice. This voice forces you to be exact in how the sentence subject acts upon the sentence object, allowing your text to be more easily understood and your writing to be more precise.
    - e.g.: "The process reads the file" (active) vs. "The file is read by the process" (passive)
- Write in **direct speech**, and not indirect speech. Writing in indirect speech may leave your text to be imprecise and hard to follow, as the reader may not know which previously mentioned object you are referring to.
    - e.g.: "The process reads the file. However, the read is quite slow." (direct) vs. "The process reads the file. However, it is quite slow." (passive - unclear what 'it' is referring to).

(WIP)

### Figure Style

In essence, ensure you have nice and clean looking figures.
Figures are one of the first elements a reader looks at when judging your work, and figures leave a lasting impression.
Moreover, figures are crucial for explaining in-depth concepts with multiple interacting components.

- Use clean, **non-sketch style** and **aligned** figures.
- Be consistent in your usage of font size and style. The consistency should remain across all figures, and ideally, should match with the style and size of your thesis.
- Use correct alignment. Different components and text should align in a nice and clean way.
- If you use colors to differentiate between different components, please use an extra pattern element to enable the reader to differentiate between them as well.
    - Some readers like to print out your work in black and white; thus, a pure color coding may no longer be visible.
    - Further, some readers have color viewing disabilities, and you just may have only used red and green :(
    - Ideally, print your work one final time in black and white before submission, to ensure all figures are readable.
- Go for wide and compact figures; not spacey and lengthy figures. Otherwise, the figures take up too much room, which you could be using for text.

Examples: **TODO**. (WIP)

### Reference Style

Here again, consistency is key.
When reviewing works, the cleanliness of the references is a sure way to identify if a fair amount of effort was put into the thesis.

- **Always** cite the original source of any information you use.
    - e.g. not the blog post which explains SGX attestation, but the original SGX white paper which first introduces the concept.
- For every reference type (e.g. conference proceeding, online link, book...) stick to one key format present in all of the reference types.
    - e.g. for proceedings: Author(s), Title, Conference, Date:
> S. Arnautov, B. Trach, F. Gregor, T. Knauth, A. Martin, C. Priebe, J. Lind, D. Muthukumaran, D. O’Keeffe, M. L. Stillwell, D. Goltzsche, D. Eyers, R. Kapitza, P. Pietzuch, and C. Fetzer. “SCONE: Secure Linux Containers with Intel SGX.” In: Proceedings of the 12th USENIX Symposium on Operating Systems Design and Implementation. USENIX Association, 2016.

(WIP)


### Submit your thesis

- Submit it on time! If you are sick or any extension worthy reason comes up, you must extend the thesis with the examination office
- Here is how to submit: https://tu-dresden.de/ing/informatik/studium/examination-office/faqs