<script>
  import Loading from "../../../components/loading.svelte";
  import ShowCategory from "./show/category.svelte";
  import EditCategory from "./edit/category.svelte";
  import { CategoryModel } from "../../../../lib/models/category";

  export let categoryId;
  export let graphqlClient;
  export let show = true;

  let category = CategoryModel().findOne(graphqlClient, categoryId);

  function reload() {
    category.refetch();
  }
</script>

{#await $category}
  <Loading />
{:then result}
  {#if show}
    <ShowCategory
      category={result.data.categories[0]}
      {graphqlClient}
      on:updateCategory={reload} />
  {:else}
    <EditCategory category={result.data.categories[0]} {graphqlClient} />
  {/if}
{:catch error}
  Error: {error}
{/await}
