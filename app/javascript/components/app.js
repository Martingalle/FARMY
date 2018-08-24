
import instantsearch from "instantsearch.js";
import { connectSearchBox } from "instantsearch.js/es/connectors";
import { searchBox } from "instantsearch.js/es/widgets";
import { hits } from "instantsearch.js/es/widgets";
import { menuSelect } from "instantsearch.js/es/widgets";

function algolia() {
  const run = document.getElementById('btn-filter');
  if (run) {
    var search = instantsearch({
      // Replace with your own values
      appId: 'SKX89A4FJH',
      apiKey: '5e4b8fadac63630bef14ead37e3e97d4', // search only API key, no ADMIN key
      indexName: 'Machine_production',
      routing: true,
      searchParameters: {
        hitsPerPage: 10
      }
    });

    search.addWidget(
      searchBox({
        container: '#search',
        placeholder: 'Tractor Lyon',
        autofocus: false,
        poweredBy: true,
        reset: true,
        loadingIndicator: false
      })
    );

    search.addWidget(
      hits({
        container: '#hits',
        templates: {
          item: document.getElementById('hit-template').innerHTML,
          empty: "We didn't find any results for the search <em>\"{{query}}\"</em>"
        }
      })
    );

    search.addWidget(
      menuSelect({
        container: '#make-filter',
        attributeName: 'location',
        limit: 10,
        templates: {
          header: 'Make'
        }
      })
    );

    search.start();
  }
}

export { algolia };
