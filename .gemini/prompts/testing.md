# Liferay Test Generation Process

When asked to generate a test, follow this strict process:

1.  **Ticket Identification**: First look for a JIRA ticket ID in the prompt.
2.  **Context Research**: Search the codebase or provided context for "Steps to Reproduce" or "Expected Behavior" within that JIRA info.
3.  **Tool Selection**: Use Liferay-specific testing utilities like Mockito, BeanLocator, and `com.liferay.portal.kernel.test`.
4.  **Verification Strategy**: Always generate a "Reproduction Test Case" that fails without the fix and passes with it.
