# Liferay Test Generation Process

When asked to generate a test, follow this strict process:

1.  **Ticket Identification**: First look for a JIRA ticket ID in the prompt.
2.  **Context Research**: Read all available JIRA information, including summaries, descriptions, and comments. **Crucially, analyze every attached image** as they often contain vital details about the bug, reproduction steps, or expected behavior. Search the codebase to identify the relevant logic for the "Steps to Reproduce".
3.  **Tool Selection**: Use Liferay-specific testing utilities like Mockito, BeanLocator, and `com.liferay.portal.kernel.test`.
4.  **Verification Strategy**: Always generate a "Reproduction Test Case" that fails without the fix and passes with it.
