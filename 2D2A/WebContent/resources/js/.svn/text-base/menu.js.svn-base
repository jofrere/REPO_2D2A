/**********************/
/*         Menu       */
/**********************/

// the timeout for the menu
var timeout = 500;

// not very clean but simple
// the function can be run in the HTML for faster display
// window.onload=initMenu;

// creat timeout variables for list item
// it's for avoid some warning with IE
for( var i = 0; i < 100; i++ )
{
    eval("var timeoutli" + i + " = false;");
}

// this fonction apply the CSS style and the event
function initMenu(menuId)
{	
    // a test to avoid some browser like IE4, Opera 6, and IE Mac
    if ( browser.isDOM1 
    && !( browser.isMac && browser.isIE ) 
    && !( browser.isOpera && browser.versionMajor < 7 )
    && !( browser.isIE && browser.versionMajor < 5 ) )
    {
        // get some element
        var menu = document.getElementById(menuId); // the root element
        var lis = menu.getElementsByTagName('li'); // all the li
        
        // change the class name of the menu, 
        // it's usefull for compatibility with old browser
        menu.className='menu';
        
        // i am searching for ul element in li element
        for ( var i=0; i<lis.length; i++ )
        {
            // is there a ul element ?
            if ( lis.item(i).getElementsByTagName('ul').length > 0 )
            {        
                // improve IE key navigation
                if ( browser.isIE )
                {
                    addAnEvent(lis.item(i),'keyup',show);
                }
                // link events to list item
                addAnEvent(lis.item(i),'mouseover',show);
                addAnEvent(lis.item(i),'mouseout',timeoutHide);
                addAnEvent(lis.item(i),'blur',timeoutHide);
                addAnEvent(lis.item(i),'focus',show);
                
                // add an id to list item
                lis.item(i).setAttribute( 'id', "li"+i );
            }
        }
    }
}

function addAnEvent( target, eventName, functionName )
{
    // apply the method to IE
    if ( browser.isIE )
    {
        //attachEvent dont work properly with this
        eval('target.on'+eventName+'=functionName');
    }
    // apply the method to DOM compliant browsers
    else
    {
        target.addEventListener( eventName , functionName , true ); // true is important for Opera7
    }
}
    
// hide the first ul element of the current element
function timeoutHide()
{
    // start the timeout
    eval( "timeout" + this.id + " = window.setTimeout('hideUlUnder( \"" + this.id + "\" )', " + timeout + " );");
}

// hide the ul elements under the element identified by id
function hideUlUnder( id )
{   
    document.getElementById(id).getElementsByTagName('ul')[0].style['visibility'] = 'hidden';
}

// show the first ul element found under this element
function show()
{
    // show the sub menu
    this.getElementsByTagName('ul')[0].style['visibility'] = 'visible';
    var currentNode=this;
    while(currentNode)
    {
            if( currentNode.nodeName=='LI')
            {
                currentNode.getElementsByTagName('a')[0].className = 'a_menu_linkOver';
            }
            currentNode=currentNode.parentNode;
    }
    // clear the timeout
    eval ( "clearTimeout( timeout"+ this.id +");" );
    hideAllOthersUls( this );
}

// hide all ul on the same level of  this list item
function hideAllOthersUls( currentLi )
{
    var lis = currentLi.parentNode;
    for ( var i=0; i<lis.childNodes.length; i++ )
    {
        if ( lis.childNodes[i].nodeName=='LI' && lis.childNodes[i].id != currentLi.id )
        {
            hideUlUnderLi( lis.childNodes[i] );
        }
    }
}



//TODO : to be implemented : hide brother 
function hideBrother(lis) {
	var parentLis = lis.parentNode;
	for ( var i=0; i<parentLis.childNodes.length; i++ )
    {
        if ( parentLis.childNodes[i] != lis)
        {
            //hideUlUnderLi( parentLis.childNodes[i] );
            var uls = parentLis.getElementsByTagName('li');
            for ( var i=0; i<uls.length; i++ )
		    {
		        //alert(uls.item(i).childNodes[0].text);
		    }            
        }
    }
}

// hide all the ul wich are in the li element
function hideUlUnderLi( li )
{
    var as = li.getElementsByTagName('a');
    for ( var i=0; i<as.length; i++ )
    {
        as.item(i).className="";
    }
    var uls = li.getElementsByTagName('ul');
    for ( var i=0; i<uls.length; i++ )
    {
        uls.item(i).style['visibility'] = 'hidden';
    }
} 

