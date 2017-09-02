<style>
  #tabDoc {
      overflow: hidden;
  }

  #tabDoc::before {
      position: absolute;
      content: "";
      right: 0;
      top: 0;
      bottom: 0;
      width: 30px;
      background: -moz-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 90%, rgba(255,255,255,1) 100%);
      background: -webkit-linear-gradient(left, rgba(255,255,255,0) 0%,rgba(255,255,255,1) 90%,rgba(255,255,255,1) 100%);
      background: linear-gradient(to right, rgba(255,255,255,0) 0%,rgba(255,255,255,1) 90%,rgba(255,255,255,1) 100%);
  }

  #treePane .tab-page ul {
      margin: 0;
      margin-bottom: 5px;
      padding: 0;
  }

  #treePane .tab-page ul li {
      list-style: none;
      padding-left: 8px;
  }

  #treePane .tab-page ul li li {
      list-style: none;
      padding-left: 5px;
      line-height: 1.6;
  }

  #treePane .tab-page ul li a {
      text-decoration: none;
  }

  #treePane .tab-page ul li a:hover {
      text-decoration: underline;
  }

  #treePane .tab {
      padding-left: 7px;
      padding-right: 7px;
  }

  #treePane .tab > span > .fa {
      margin-right: 2px;
      margin-left: 2px;
  }

  #treePane .tab.selected {
      padding-bottom: 6px;
  }

  #treePane .tab-row .tab span {
      font-size: 14px;
  }

  /* Clearfix to avoid .tab-row height() = 0 */
  #treePane .tab-row:after {
      content: ".";
      clear: both;
      display: block;
      visibility: hidden;
      height: 0px;
  }

  #treePane .ext-ico {
      text-decoration:none!important;
      color:#97D19C!important;
  }

  #treePane ul > li > strong > a.catname
  {
      color: #444;
  }

  #treePane .fade {
      opacity: 0;
      -webkit-transition: opacity .15s linear;
      -o-transition: opacity .15s linear;
      transition: opacity .15s linear;
  }

  #treePane .fade.in {
      opacity: 1;
  }

  #treePane .collapse {
      display: none;
  }

  #treePane .collapse.in {
      display: block;
  }

  #treePane tr.collapse.in {
      display: table-row;
  }

  #treePane tbody.collapse.in {
      display: table-row-group;
  }

  #treePane .collapsing {
      position: relative;
      height: 0;
      overflow: hidden;
      -webkit-transition-timing-function: ease;
               -o-transition-timing-function: ease;
                      transition-timing-function: ease;
      -webkit-transition-duration: .35s;
               -o-transition-duration: .35s;
                      transition-duration: .35s;
      -webkit-transition-property: height;
      -o-transition-property: height;
      transition-property: height;
  }

  #treePane.no-transition .collapsing {
      -webkit-transition: none;
      -o-transition: none;
      transition: none;
  }

  #treePane .panel-title a{
      display: block;
      padding: 4px 0 4px 17px;
      color: #657587;
      font-weight: bold;
  }
  
  #treePane .panel-title a:hover {
      text-decoration: none;
  }
  
  #treePane .panel-title a:focus {
      text-decoration: none;
  }

  #treePane .panel-title > a::before {
      content: "\f107"; /* fa-angle-down */
      font-family: "FontAwesome";
      margin-left:-17px;
      width: 10px;
      display: inline-block;
  }
  #treePane .panel-title > a.collapsed::before {
      content: "\f105"; /* fa-angle-right */
      padding:0 2px;
  }
  #treePane .panel-title > a[aria-expanded="true"] {
      color: #657587;
  }

  #treePane li.eltree {
      margin-left: 5px;
      line-height: 1.4em;
  }

  #treePane li.eltree:before {
      font-family: FontAwesome;
      padding:0 5px 0 0;
      margin-right:2px;
      color: #657587;
  }

  .filterElements-form--eit {
      width: 200px;
      width: calc(100% - 70px);
  }

  .actionButtons--eit {
      position: absolute;
      top: 25px;
      right: 10px;
  }

  .actionButtons--eit li {
      margin-right: 5px;
      padding-left: 0 !important;
  }

  .actionButtons--eit a {
      padding: 5px 8px;
      font-size: 14px;
  }

  #tabTemp li.eltree:before {content: "\f1ea";}
  #tabCH   li.eltree:before {content: "\f009";}
  #tabSN   li.eltree:before {content: "\f121";}
  #tabTV   li.eltree:before {content: "\f022";}
  #tabPL   li.eltree:before {content: "\f1e6";}
  #tabMD   li.eltree:before {content: "\f085";}

  .tab-page { margin-bottom:0; }
  
  /* ElementsInTree main styles */
  
  @media (max-width: 840px) {

    .ElementsInTree #tree {
      max-width: 345px;
    }
    
  }

  .ElementsInTree #tree a {
    color: #404040;
  }

  .ElementsInTree #tree .treeframebody {
    background-color: #fafafa !important;
    border-right: 1px solid #cfd2d6
  }

  .ElementsInTree #tree #treeHolder {
    height: 100%;
    max-height: 100%;
    overflow: hidden;
    padding: 0
  }

  .ElementsInTree #tree .actionButtons--eit {
    top: 2.8rem;
    right: 1rem
  }

  .ElementsInTree #tree .actionButtons--eit li {
    float: left;
    margin: 0 0 0 5px !important;
  }

  .ElementsInTree #tree .actionButtons--eit li a {
    padding: 0.5rem;
  }

  .ElementsInTree #tree .tab-page {
    padding: 0.8rem 0 0.8rem 0.8rem !important;
    background-color: #fff;
    border: 1px solid #ddd;
    border-width: 1px 0;
    box-shadow: none;
    min-height: 55px;
  }

  .ElementsInTree #tree .tab-page .panel-group .panel,
  .ElementsInTree #tree #tabDoc.tab-page>div {
    max-height: calc(100vh - 10rem) !important;
    overflow: auto;
  }

  .ElementsInTree #tree .tab-page .panel-group {
    overflow: visible !important;
    max-height: none !important;
    box-sizing: border-box !important;
    padding-top: 5px;
  }

  .ElementsInTree #tree .tab-row {
    padding: 0;
    margin-bottom: -1px;
    display: table;
    width: 100%;
    table-layout: fixed;
    border-top: 1px solid #CFD2D6;
    background-color: #dfdfdf;
  }

  .ElementsInTree #tree .tab-row .tab {
    height: 1.8rem;
    line-height: 1.75rem;
    background-color: transparent;
    border-color: #cfd2d6;
    border-width: 0 1px 0 0;
    display: table-cell;
    text-align: center;
    vertical-align: middle;
    width: 100%;
  }

  .ElementsInTree #tree .tab-row .tab:last-child {
    border-width: 0;
  }

  .ElementsInTree #tree .tab-row .tab:hover {
      background-color: rgba(255, 255, 255, 0.5);
   }

  .ElementsInTree #tree .tab-row .tab.selected {
    padding-bottom: 0;
    background-color: #fff;
  }

  .ElementsInTree #tree .form-control {
    padding: 0.25rem;
    font-size: 0.8rem;
  }

  .ElementsInTree #tree .eltree {
    line-height: 1.5
  }

  .ElementsInTree #tree .eltree img {
    width: 0.8em;
    height: 0.8em
  }

  .ElementsInTree #tree #tabDoc {
    padding-top: 7px !important;
    padding-left: 0 !important;
    padding-left: 0 !important;
  }

  .ElementsInTree #tree #tabDoc::before {
    display: none
  }

  .ElementsInTree #treeMenu {
    height: 1.8rem;
    background-color: #DFDFDF !important;
  }

  .ElementsInTree #treeMenu.is-intab {
    margin-left: 0.1rem;
    height: 1.875rem;
    background-color: transparent !important;
  }

  .ElementsInTree.treeframebody {
    -webkit-box-shadow: none;
    box-shadow: none
  }

  .ElementsInTree .filterElements-form--eit {
    width: 200px !important;
    width: calc(100% - 85px) !important;
  }

  .dark.ElementsInTree #tree .treeframebody {
    background-color: #1d2023 !important;
    color: #828282;
    border-color: #2a2d33
  }

  .dark.ElementsInTree #tree .tab-row {
    border-top-color: #343739;
  }

  .dark.ElementsInTree #tree .tab-row .tab {
    color: #7b7b7b;
    border-color: #2a2d33;
    background-color: #1a1c21;
  }

  .dark.ElementsInTree #tree .tab-row .tab:hover {
      background-color: #2d3033;
   }

  .dark.ElementsInTree #tree .tab-row .tab.selected {
    background-color: #24272A;
    border-color: #343739;
    color: #bfbfbf;
  }

  .dark.ElementsInTree #tree .tab-page {
    background-color: #24272A;
    border-color: rgba(255, 255, 255, .1)
  }

  .dark.ElementsInTree #tree .form-control {
    background-color: rgba(0, 0, 0, 0.4);
    border-color: rgba(255, 255, 255, 0.09);
    color: #c7c7c7;
  }

  .dark.ElementsInTree #tree a {
    color: #b7b7b7
  }

  .dark.ElementsInTree #tree .disabledPlugin a {
    color: #b68282
  }

  .dark.ElementsInTree #treeMenu {
    background-color: rgba(0, 0, 0, 0.2) !important;
  }

  .dark.ElementsInTree #treeMenu.is-intab {
    background-color: transparent !important;
  }


  /* Unify frames */

  body,
  div.treeframebody {
    background-color: #f2f2f2 !important;
  }

  div.treeframebody {
    background-color: transparent !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
  }

  #treeMenu {
    background-color: transparent !important;
    border-bottom-color: transparent !important;
  }

  [+treeButtonsInTab_css+]

</style>

<div class="tab-pane no-transition" id="treePane" style="border:0;">
<script type="text/javascript" src="media/script/tabpane.js"></script>
<script src="media/script/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="media/script/jquery.quicksearch.js"></script>
<script type="text/javascript" src="media/script/jquery.nucontextmenu.js"></script>
<script>
    function initQuicksearch(inputId, listId) {
        jQuery("#"+inputId).quicksearch("#"+listId+" ul li", {
            selector: ".elementname",
            "show": function () { jQuery(this).removeClass("hide"); },
            "hide": function () { jQuery(this).addClass("hide"); },
            "bind":"keyup",
            "onAfter": function() {
                jQuery("#"+listId).find(".panel-collapse").each( function() {
                    var parentLI = jQuery(this);
                    var totalLI  = jQuery(this).find("li").length;
                    var hiddenLI = jQuery(this).find("li.hide").length;
                    if (hiddenLI == totalLI) { parentLI.prev(".panel-heading").addClass("hide"); }
                    else { parentLI.prev(".panel-heading").removeClass("hide"); }
                });
            }
        });
        jQuery(".filterElements-form").keydown(function (e) {
            if (e.keyCode == 13) {
                e.preventDefault();
            }
        });
    }
    
    var storageKey = "MODX_elementsInTreeParams";
    
    // localStorage reset :
    // localStorage.removeItem(storageKey);
    
    // Prepare remember collapsed categories function
    var storage = localStorage.getItem(storageKey);
    var elementsInTreeParams = {};
    var searchFieldCache = {};

    try {
        if(storage != null) {
            try {
                elementsInTreeParams = JSON.parse( storage );
            } catch(err) {
                console.log(err);
                elementsInTreeParams = { "cat_collapsed": {}, "scroll_pos": {} };
            }
        } else {
            elementsInTreeParams = { "cat_collapsed": {}, "scroll_pos": {} };
        }
        
        // Remember collapsed categories functions
        function setRememberCollapsedCategories(obj=null) {
            obj = obj == null ? elementsInTreeParams.cat_collapsed : obj;
            for (var type in obj) {
                if (!elementsInTreeParams.cat_collapsed.hasOwnProperty(type)) continue;
                for (var category in elementsInTreeParams.cat_collapsed[type]) {
                    if (!elementsInTreeParams.cat_collapsed[type].hasOwnProperty(category)) continue;
                    state = elementsInTreeParams.cat_collapsed[type][category];
                    if(state == null) continue;
                    var collapseItem = jQuery("#collapse" + type + category);
                    var toggleItem = jQuery("#toggle" + type + category);
                    if(state == 0) {
                        // Collapsed
                        collapseItem.collapse("hide");
                        toggleItem.addClass("collapsed");
                    } else {
                        // Open
                        collapseItem.collapse("show");
                        toggleItem.removeClass("collapsed");
                    } 
                }
            }
            // Avoid first category collapse-flicker on reload
            setTimeout(function() {
               jQuery("#treePane").removeClass("no-transition");
            }, 50);
        }

        function setLastCollapsedCategory(type, id, state) {
              state = state != 1 ? 1 : 0;
              if(typeof elementsInTreeParams.cat_collapsed[type] == "undefined") elementsInTreeParams.cat_collapsed[type] = {};
              elementsInTreeParams.cat_collapsed[type][id] = state;
        }
        function writeElementsInTreeParamsToStorage() {
            var jsonString = JSON.stringify(elementsInTreeParams);
            localStorage.setItem(storageKey, jsonString );
        }
        
        // Issue #20 - Keep HTTP_REFERER
//        function reloadElementsInTree() {
//            // http://stackoverflow.com/a/7917528/2354531
//            var url = "index.php?a=1&f=tree";
//            var a = document.createElement("a");
//            if (a.click)
//            {
//                // HTML5 browsers and IE support click() on <a>, early FF does not.
//                a.setAttribute("href", url);
//                a.style.display = "none";
//                document.body.appendChild(a);
//                a.click();
//            } else {
//                // Early FF can, however, use this usual method where IE cannot with secure links.
//                window.location = url;
//            }
//        }
        
        /////////////////////////////////////////////////////////////
        // Prepare "remember scroll-position" functions
        var tabIds = ["tree_site_templates","tree_site_tmplvars","tree_site_htmlsnippets","tree_site_snippets","tree_site_plugins","tree_site_modules"];
        
        function getScrollXY(tab) {
            var t = document.getElementById(tab);
            return [t.scrollLeft, t.scrollTop];
        }

        function setScrollXY(tab, pos) {
            document.getElementById(tab).scrollLeft = pos[0];
            document.getElementById(tab).scrollTop = pos[1];
        }
        
        // Window load
        function loadPositions() {
            for (var i = 0; i < tabIds.length; i++) {
                var tabId = tabIds[i];
                var tabEl = jQuery("#"+tabId);
                tabEl.css("box-sizing","content-box").css("overflow","auto");
                if(typeof elementsInTreeParams.scroll_pos[tabId] == "undefined" || tabEl.length < 1) continue;
                var tabPage = tabEl.closest(".tab-page");
                if(tabPage.is(":visible")) {
                    setScrollXY(tabId, elementsInTreeParams.scroll_pos[tabId]);
                } else {
                    tabPage.show();
                    setScrollXY(tabId, elementsInTreeParams.scroll_pos[tabId]);
                    tabPage.hide(); 
                }
            }
        }
        
        // Window unload
        function savePositions() {
            if(typeof elementsInTreeParams.scroll_pos == "undefined") { elementsInTreeParams.scroll_pos = {}; }
            for (var i = 0; i < tabIds.length; i++) {
                var tabId = tabIds[i];
                var tabEl = jQuery("#"+tabId);
                if(tabEl.length < 1) continue;
                var tabPage = tabEl.closest(".tab-page");
                if(tabPage.is(":visible")) {
                    elementsInTreeParams.scroll_pos[tabId] = getScrollXY(tabId);
                } else {
                    tabPage.show(); 
                    elementsInTreeParams.scroll_pos[tabId] = getScrollXY(tabId);
                    tabPage.hide(); 
                }
                
            }
            writeElementsInTreeParamsToStorage();
        }
        
        // Window load & resize
        var winHeight, tabsHeight, buttonsSize, themeMargins, tabHeight;
        
        function determineHeightValues() {
            winHeight = jQuery(window).height();
            tabsHeight = jQuery(".tab-row:first").height();
            buttonsSize = jQuery(".filterElements-form:first").getSize();
            themeMargins = 60; // All MODxRE2 top/bottom margins
            tabHeight = winHeight - tabsHeight - buttonsSize.height - themeMargins;
        }
        
        function setTabsHeight() {
            for (var i = 0; i < tabIds.length; i++) {
                var tabId = tabIds[i];
                var tabEl = jQuery("#"+tabId);
                tabEl.css("max-height",tabHeight+"px");
            }
        }
        
        jQuery(window).on("load", function() {
            determineHeightValues();
            setTabsHeight();
            // Workaround for Firefox, which sometimes does not set scrollTop, 1ms is hopefully enough 
            var initDelay = setTimeout(function(){
                loadPositions();
            }, 1);
        });
        jQuery(window).on("unload", function() {
            savePositions();
        });
        jQuery(window).on("resize", function() {
            determineHeightValues();
            setTabsHeight();
        });
        
        // Get size of invisible elements - http://stackoverflow.com/a/8839261/2354531
        jQuery.fn.getSize = function() {    
            var $wrap = jQuery("<div />").appendTo(jQuery("body"));
            $wrap.css({
                "position":   "absolute !important",
                "visibility": "hidden !important",
                "display":    "block !important"
            });
        
            $clone = jQuery(this).clone().appendTo($wrap);
        
            sizes = {
                "width": $clone.width(),
                "height": $clone.height()
            };
        
            $wrap.remove();
        
            return sizes;
        };
        /////////////////////////////////////////////////////////////
    
        jQuery(document).ready(function() {

        jQuery(".filterElements-form").keydown(function (e) {
            if(e.keyCode == 13) e.preventDefault();
        });
      
        [+treeButtonsInTab_js+]
        
        // Shift-Mouseclick opens/collapsed all categories
        jQuery(".accordion-toggle").click(function(e) {
                  e.preventDefault();
                  var thisItemCollapsed = jQuery(this).hasClass("collapsed");
                  if (e.shiftKey) {
                      // Shift-key pressed
                      var toggleItems = jQuery(this).closest(".panel-group").find("> .panel .accordion-toggle");
                      var collapseItems = jQuery(this).closest(".panel-group").find("> .panel > .panel-collapse");
                      if(thisItemCollapsed) {
                        toggleItems.removeClass("collapsed");
                        collapseItems.collapse("show");
                      } else {
                        toggleItems.addClass("collapsed");
                        collapseItems.collapse("hide");
                      }
                      // Save states to localStorage
                      toggleItems.each(function() {
                        state = jQuery(this).hasClass("collapsed") ? 1 : 0;
                        setLastCollapsedCategory(jQuery(this).data("cattype"), jQuery(this).data("catid"), state);
                      });
                      writeElementsInTreeParamsToStorage();
                  } else {
                    jQuery(this).toggleClass("collapsed");
                    jQuery(jQuery(this).attr("href")).collapse("toggle");
                    // Save state to localStorage
                    state = thisItemCollapsed ? 0 : 1;
                    setLastCollapsedCategory(jQuery(this).data("cattype"), jQuery(this).data("catid"), state);
                    writeElementsInTreeParamsToStorage();
                  }
            });
              
            setRememberCollapsedCategories();

        });
    } catch(err) {
        alert("document.ready error: " + err);
    }
</script>
<script type="text/javascript">
treePane = new WebFXTabPane(document.getElementById( "treePane" ),true);
</script>
<div class="tab-page" id="tabDoc" style="padding-left:0; padding-right:0;">
<h2 class="tab">[+tabTreeTitle+]</h2>
<script type="text/javascript">treePane.addTabPage( document.getElementById( "tabDoc" ) );</script>
