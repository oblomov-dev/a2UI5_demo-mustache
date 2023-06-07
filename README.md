# Demo Mustache using abap2UI5
The Mustache open-source project for ABAP simplifies XML generation and can be used to define views for abap2UI5.
<br>
1. Install [**abap2UI5**](https://github.com/oblomov-dev/abap2UI5)
2. Intall the open-source project [**Mustache**](https://github.com/sbcgua/abap_mustache)
3. Install this repository and try out the [**demo**](https://github.com/oblomov-dev/demo_abap2UI5-mustache/blob/main/src/z2ui5_cl_demo_mustache.clas.abap)
<br>
**UI5 Output:**
<img width="1487" alt="image" src="https://github.com/oblomov-dev/demo_abap2UI5-mustache/assets/102328295/702170be-3718-4bfa-b683-0fc35b01106d">
**Backend XML - Input for Mustache:**
```XML
<mvc:View controllerName="z2ui5_controller"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc"
	xmlns:core="sap.ui.core" >
	<Shell>
		<Page title="{{title}}">
			<headerContent>{{#t_header}}
				<Button text="{{text}}" press="{{ucomm}}"/>{{/t_header}}
			</headerContent>
			<content>
				<List headerText="{{title_tab}}">{{#t_table}}
					<CustomListItem>
						<core:Icon size="2rem" src="{{icon}}" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
						<Title text="{{name}}" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
						<ProgressIndicator class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" percentValue="{{progress}}" showValue="true" state="{{state}}" />
						<Text text="{{descr}}" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
					</CustomListItem>{{/t_table}}
				</List>
			</content>
			<footer>
				<OverflowToolbar>
					<ToolbarSpacer/>{{#t_footer}}
					<Button text="{{text}}" press="{{ucomm}}"/>{{/t_footer}}
				</OverflowToolbar>
			</footer>
		</Page>
	</Shell>
</mvc:View>
```
**Frontend UI5-View:**
```XML
<mvc:View controllerName="z2ui5_controller"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc"
	xmlns:core="sap.ui.core" >
	<Shell>
		<Page title="UI5 View created with Mustache">
			<headerContent>
				<Button text="User" press="onEvent( { 'EVENT' : 'USER', 'METHOD' : 'UPDATE' } , false , '' , '' , '' )"/>
				<Button text="Info" press="onEvent( { 'EVENT' : 'INFO', 'METHOD' : 'UPDATE' } , false , '' , '' , '' )"/>
			</headerContent>
			<content>
				<List headerText="List Control">
					<CustomListItem>
						<core:Icon size="2rem" src="sap-icon://accelerated" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
						<Title text="Theo" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
						<ProgressIndicator class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" percentValue="90" showValue="true" state="Success" />
						<Text text="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed..." class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
					</CustomListItem>
					<CustomListItem>
						<core:Icon size="2rem" src="sap-icon://account" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
						<Title text="Sarah" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
						<ProgressIndicator class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" percentValue="40" showValue="true" state="None" />
						<Text text="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed..." class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />
					</CustomListItem>
				</List>
			</content>
			<footer>
				<OverflowToolbar>
					<ToolbarSpacer/>
					<Button text="Cancel" press="onEvent( { 'EVENT' : 'CANCEL', 'METHOD' : 'UPDATE' } , false , '' , '' , '' )"/>
					<Button text="Post" press="onEvent( { 'EVENT' : 'POST', 'METHOD' : 'UPDATE' } , false , '' , '' , '' )"/>
				</OverflowToolbar>
			</footer>
		</Page>
	</Shell>
</mvc:View>
```


