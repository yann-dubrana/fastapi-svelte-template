<script lang="ts">

    import {onMount} from "svelte";

    type HelloWorld = {
        message: string;
    }

    let hello: HelloWorld | undefined = $state(undefined);
    onMount(async () => {
        const response = await fetch('/hello-world')
        hello = await response.json() as HelloWorld;
    });

</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>
{#if hello}
    <p>You've been greeted by Python who say: {hello.message}</p>
{/if}
