CREATE TABLE [access] (
	[user_id] [int] IDENTITY (0, 1) NOT NULL ,
	[username] [varchar] (80) NOT NULL ,
	[password] [varchar] (80) NULL ,
	[contact_id] [int] NULL ,
	[role_id] [int] NULL ,
	[manager_id] [int] NULL ,
	[startofday] [int] NULL ,
	[endofday] [int] NULL ,
	[locale] [varchar] (255) NULL ,
	[timezone] [varchar] (255) NULL ,
	[last_ip] [varchar] (15) NULL ,
	[last_login] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[expires] [datetime] NULL ,
	[alias] [int] NULL ,
	[assistant] [int] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [asset_category] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[cat_level] [int] NOT NULL ,
	[parent_cat_code] [int] NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[full_description] [text] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [asset_category_draft] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_id] [int] NULL ,
	[cat_level] [int] NOT NULL ,
	[parent_cat_code] [int] NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[full_description] [text] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [autoguide_ad_run_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (20) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [autoguide_make] (
	[make_id] [int] IDENTITY (1, 1) NOT NULL ,
	[make_name] [varchar] (30) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [autoguide_options] (
	[option_id] [int] IDENTITY (1, 1) NOT NULL ,
	[option_name] [varchar] (20) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_component_library] (
	[component_id] [int] IDENTITY (1, 1) NOT NULL ,
	[component_name] [varchar] (255) NOT NULL ,
	[type_id] [int] NOT NULL ,
	[class_name] [varchar] (255) NOT NULL ,
	[description] [varchar] (510) NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_log] (
	[process_name] [varchar] (255) NOT NULL ,
	[anchor] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_parameter_library] (
	[parameter_id] [int] IDENTITY (1, 1) NOT NULL ,
	[component_id] [int] NULL ,
	[param_name] [varchar] (255) NULL ,
	[description] [varchar] (510) NULL ,
	[default_value] [varchar] (4000) NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [database_version] (
	[version_id] [int] IDENTITY (1, 1) NOT NULL ,
	[script_filename] [varchar] (255) NOT NULL ,
	[script_version] [varchar] (255) NOT NULL ,
	[entered] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [field_types] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[data_typeid] [int] NOT NULL ,
	[data_type] [varchar] (20) NULL ,
	[operator] [varchar] (50) NULL ,
	[display_text] [varchar] (50) NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_access_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[link_module_id] [int] NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[rule_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_account_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_asset_status] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_call_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_contactaddress_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_contactemail_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_contactphone_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_creditcard_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_currency] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_delivery_options] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_department] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_email_model] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_employment_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_help_features] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (1000) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_hours_reason] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_industry] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_instantmessenger_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_locale] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_onsite_model] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_opportunity_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_order_source] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_order_status] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_order_terms] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_order_type] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_orderaddress_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_orgaddress_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_orgemail_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_orgphone_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_payment_methods] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_phone_model] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_category_type] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_conf_result] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_format] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_keyword] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_ship_time] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_shipping] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_tax] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_product_type] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_project_activity] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[group_id] [int] NOT NULL ,
	[template_id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_project_issues] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[group_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_project_loe] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[base_value] [int] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[group_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_project_priority] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[group_id] [int] NOT NULL ,
	[graphic] [varchar] (75) NULL ,
	[type] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_project_status] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[group_id] [int] NOT NULL ,
	[graphic] [varchar] (75) NULL ,
	[type] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_quote_source] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_quote_status] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_quote_terms] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_quote_type] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_recurring_type] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_response_model] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_revenue_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_revenuedetail_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_sc_category] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_sc_type] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_stage] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_survey_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_task_category] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_task_loe] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_task_priority] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_ticketsource] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [notification] (
	[notification_id] [int] IDENTITY (1, 1) NOT NULL ,
	[notify_user] [int] NOT NULL ,
	[module] [varchar] (255) NOT NULL ,
	[item_id] [int] NOT NULL ,
	[item_modified] [datetime] NOT NULL ,
	[attempt] [datetime] NOT NULL ,
	[notify_type] [varchar] (30) NULL ,
	[subject] [text] NULL ,
	[message] [text] NULL ,
	[result] [int] NOT NULL ,
	[errorMessage] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [permission_category] (
	[category_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category] [varchar] (80) NULL ,
	[description] [varchar] (255) NULL ,
	[level] [int] NOT NULL ,
	[enabled] [bit] NOT NULL ,
	[active] [bit] NOT NULL ,
	[folders] [bit] NOT NULL ,
	[lookups] [bit] NOT NULL ,
	[viewpoints] [bit] NULL ,
	[categories] [bit] NULL ,
	[scheduled_events] [bit] NULL ,
	[object_events] [bit] NULL ,
	[reports] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [project_folders] (
	[folder_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_module_id] [int] NOT NULL ,
	[link_item_id] [int] NOT NULL ,
	[subject] [varchar] (255) NOT NULL ,
	[description] [text] NULL ,
	[parent] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [search_fields] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[field] [varchar] (80) NULL ,
	[description] [varchar] (255) NULL ,
	[searchable] [bit] NOT NULL ,
	[field_typeid] [int] NOT NULL ,
	[table_name] [varchar] (80) NULL ,
	[object_class] [varchar] (80) NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [state] (
	[state_code] [char] (2) NOT NULL ,
	[state] [varchar] (80) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sync_client] (
	[client_id] [int] IDENTITY (1, 1) NOT NULL ,
	[type] [varchar] (100) NULL ,
	[version] [varchar] (50) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[anchor] [datetime] NULL ,
	[enabled] [bit] NULL ,
	[code] [varchar] (255) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sync_system] (
	[system_id] [int] IDENTITY (1, 1) NOT NULL ,
	[application_name] [varchar] (255) NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ticket_category] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[cat_level] [int] NOT NULL ,
	[parent_cat_code] [int] NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[full_description] [text] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ticket_category_draft] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_id] [int] NULL ,
	[cat_level] [int] NOT NULL ,
	[parent_cat_code] [int] NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[full_description] [text] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ticket_level] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ticket_priority] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[style] [text] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ticket_severity] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (300) NOT NULL ,
	[style] [text] NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [usage_log] (
	[usage_id] [int] IDENTITY (1, 1) NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NULL ,
	[action] [int] NOT NULL ,
	[record_id] [int] NULL ,
	[record_size] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [access_log] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[user_id] [int] NOT NULL ,
	[username] [varchar] (80) NOT NULL ,
	[ip] [varchar] (15) NULL ,
	[entered] [datetime] NOT NULL ,
	[browser] [varchar] (255) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [action_list] (
	[action_id] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (255) NOT NULL ,
	[owner] [int] NOT NULL ,
	[completedate] [datetime] NULL ,
	[link_module_id] [int] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [autoguide_model] (
	[model_id] [int] IDENTITY (1, 1) NOT NULL ,
	[make_id] [int] NOT NULL ,
	[model_name] [varchar] (50) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process] (
	[process_id] [int] IDENTITY (1, 1) NOT NULL ,
	[process_name] [varchar] (255) NOT NULL ,
	[description] [varchar] (510) NULL ,
	[type_id] [int] NOT NULL ,
	[link_module_id] [int] NOT NULL ,
	[component_start_id] [int] NULL ,
	[enabled] [bit] NOT NULL ,
	[entered] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_component_result_lookup] (
	[result_id] [int] IDENTITY (1, 1) NOT NULL ,
	[component_id] [int] NOT NULL ,
	[return_id] [int] NOT NULL ,
	[description] [varchar] (255) NULL ,
	[level] [int] NOT NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_hook_library] (
	[hook_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_module_id] [int] NOT NULL ,
	[hook_class] [varchar] (255) NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [campaign] (
	[campaign_id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[description] [varchar] (255) NULL ,
	[list_id] [int] NULL ,
	[message_id] [int] NULL ,
	[reply_addr] [varchar] (255) NULL ,
	[subject] [varchar] (255) NULL ,
	[message] [text] NULL ,
	[status_id] [int] NULL ,
	[status] [varchar] (255) NULL ,
	[active] [bit] NULL ,
	[active_date] [datetime] NULL ,
	[send_method_id] [int] NOT NULL ,
	[inactive_date] [datetime] NULL ,
	[approval_date] [datetime] NULL ,
	[approvedby] [int] NULL ,
	[enabled] [bit] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[type] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [category_editor_lookup] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[module_id] [int] NOT NULL ,
	[constant_id] [int] NOT NULL ,
	[table_name] [varchar] (60) NULL ,
	[level] [int] NULL ,
	[description] [text] NULL ,
	[entered] [datetime] NULL ,
	[category_id] [int] NOT NULL ,
	[max_levels] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [cfsinbox_message] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[subject] [varchar] (255) NULL ,
	[body] [text] NOT NULL ,
	[reply_id] [int] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[sent] [datetime] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[type] [int] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[delete_flag] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [help_module] (
	[module_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category_id] [int] NULL ,
	[module_brief_description] [text] NULL ,
	[module_detail_description] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [help_tableof_contents] (
	[content_id] [int] IDENTITY (1, 1) NOT NULL ,
	[displaytext] [varchar] (255) NULL ,
	[firstchild] [int] NULL ,
	[nextsibling] [int] NULL ,
	[parent] [int] NULL ,
	[category_id] [int] NULL ,
	[contentlevel] [int] NOT NULL ,
	[contentorder] [int] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [import] (
	[import_id] [int] IDENTITY (1, 1) NOT NULL ,
	[type] [int] NOT NULL ,
	[name] [varchar] (250) NOT NULL ,
	[description] [text] NULL ,
	[source_type] [int] NULL ,
	[source] [varchar] (1000) NULL ,
	[record_delimiter] [varchar] (10) NULL ,
	[column_delimiter] [varchar] (10) NULL ,
	[total_imported_records] [int] NULL ,
	[total_failed_records] [int] NULL ,
	[status_id] [int] NULL ,
	[file_type] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [lookup_contact_types] (
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (50) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[enabled] [bit] NULL ,
	[user_id] [int] NULL ,
	[category] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [lookup_lists_lookup] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[module_id] [int] NOT NULL ,
	[lookup_id] [int] NOT NULL ,
	[class_name] [varchar] (20) NULL ,
	[table_name] [varchar] (60) NULL ,
	[level] [int] NULL ,
	[description] [text] NULL ,
	[entered] [datetime] NULL ,
	[category_id] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [message] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[description] [varchar] (255) NULL ,
	[template_id] [int] NULL ,
	[subject] [varchar] (255) NULL ,
	[body] [text] NULL ,
	[reply_addr] [varchar] (100) NULL ,
	[url] [varchar] (255) NULL ,
	[img] [varchar] (80) NULL ,
	[enabled] [bit] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[access_type] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [message_template] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[description] [varchar] (255) NULL ,
	[template_file] [varchar] (80) NULL ,
	[num_imgs] [int] NULL ,
	[num_urls] [int] NULL ,
	[enabled] [bit] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [module_field_categorylink] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[module_id] [int] NOT NULL ,
	[category_id] [int] NOT NULL ,
	[level] [int] NULL ,
	[description] [text] NULL ,
	[entered] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [organization] (
	[org_id] [int] IDENTITY (0, 1) NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[account_number] [varchar] (50) NULL ,
	[account_group] [int] NULL ,
	[url] [text] NULL ,
	[revenue] [float] NULL ,
	[employees] [int] NULL ,
	[notes] [text] NULL ,
	[sic_code] [varchar] (40) NULL ,
	[ticker_symbol] [varchar] (10) NULL ,
	[taxid] [char] (80) NULL ,
	[lead] [varchar] (40) NULL ,
	[sales_rep] [int] NOT NULL ,
	[miner_only] [bit] NOT NULL ,
	[defaultlocale] [int] NULL ,
	[fiscalmonth] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL ,
	[industry_temp_code] [smallint] NULL ,
	[owner] [int] NULL ,
	[duplicate_id] [int] NULL ,
	[custom1] [int] NULL ,
	[custom2] [int] NULL ,
	[contract_end] [datetime] NULL ,
	[alertdate] [datetime] NULL ,
	[alert] [varchar] (100) NULL ,
	[custom_data] [text] NULL ,
	[namesalutation] [varchar] (80) NULL ,
	[namelast] [varchar] (80) NULL ,
	[namefirst] [varchar] (80) NULL ,
	[namemiddle] [varchar] (80) NULL ,
	[namesuffix] [varchar] (80) NULL ,
	[import_id] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [permission] (
	[permission_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category_id] [int] NOT NULL ,
	[permission] [varchar] (80) NOT NULL ,
	[permission_view] [bit] NOT NULL ,
	[permission_add] [bit] NOT NULL ,
	[permission_edit] [bit] NOT NULL ,
	[permission_delete] [bit] NOT NULL ,
	[description] [varchar] (255) NOT NULL ,
	[level] [int] NOT NULL ,
	[enabled] [bit] NOT NULL ,
	[active] [bit] NOT NULL ,
	[viewpoints] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [process_log] (
	[process_id] [int] IDENTITY (1, 1) NOT NULL ,
	[system_id] [int] NOT NULL ,
	[client_id] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[process_name] [varchar] (255) NULL ,
	[process_version] [varchar] (20) NULL ,
	[status] [int] NULL ,
	[message] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [product_option_configurator] (
	[configurator_id] [int] IDENTITY (1, 1) NOT NULL ,
	[short_description] [text] NULL ,
	[long_description] [text] NULL ,
	[class_name] [varchar] (255) NULL ,
	[result_type] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [project_files] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_module_id] [int] NOT NULL ,
	[link_item_id] [int] NOT NULL ,
	[folder_id] [int] NULL ,
	[client_filename] [varchar] (255) NOT NULL ,
	[filename] [varchar] (255) NOT NULL ,
	[subject] [varchar] (500) NOT NULL ,
	[size] [int] NULL ,
	[version] [float] NULL ,
	[enabled] [bit] NULL ,
	[downloads] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [projects] (
	[project_id] [int] IDENTITY (1, 1) NOT NULL ,
	[group_id] [int] NULL ,
	[department_id] [int] NULL ,
	[template_id] [int] NULL ,
	[title] [varchar] (100) NOT NULL ,
	[shortDescription] [varchar] (200) NOT NULL ,
	[requestedBy] [varchar] (50) NULL ,
	[requestedDept] [varchar] (50) NULL ,
	[requestDate] [datetime] NULL ,
	[approvalDate] [datetime] NULL ,
	[closeDate] [datetime] NULL ,
	[owner] [int] NULL ,
	[entered] [datetime] NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [role] (
	[role_id] [int] IDENTITY (1, 1) NOT NULL ,
	[role] [varchar] (80) NOT NULL ,
	[description] [varchar] (255) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NOT NULL ,
	[role_type] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [saved_criterialist] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[owner] [int] NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[contact_source] [int] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [survey] (
	[survey_id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[description] [varchar] (255) NULL ,
	[intro] [text] NULL ,
	[outro] [text] NULL ,
	[itemLength] [int] NULL ,
	[type] [int] NULL ,
	[enabled] [bit] NOT NULL ,
	[status] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [sync_log] (
	[log_id] [int] IDENTITY (1, 1) NOT NULL ,
	[system_id] [int] NOT NULL ,
	[client_id] [int] NOT NULL ,
	[ip] [varchar] (15) NULL ,
	[entered] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sync_table] (
	[table_id] [int] IDENTITY (1, 1) NOT NULL ,
	[system_id] [int] NOT NULL ,
	[element_name] [varchar] (255) NULL ,
	[mapped_class_name] [varchar] (255) NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[create_statement] [text] NULL ,
	[order_id] [int] NULL ,
	[sync_item] [bit] NULL ,
	[object_key] [varchar] (50) NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [task] (
	[task_id] [int] IDENTITY (1, 1) NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[priority] [int] NOT NULL ,
	[description] [varchar] (80) NULL ,
	[duedate] [datetime] NULL ,
	[reminderid] [int] NULL ,
	[notes] [text] NULL ,
	[sharing] [int] NOT NULL ,
	[complete] [bit] NOT NULL ,
	[enabled] [bit] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NULL ,
	[estimatedloe] [float] NULL ,
	[estimatedloetype] [int] NULL ,
	[type] [int] NULL ,
	[owner] [int] NULL ,
	[completedate] [datetime] NULL ,
	[category_id] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [viewpoint] (
	[viewpoint_id] [int] IDENTITY (1, 1) NOT NULL ,
	[user_id] [int] NOT NULL ,
	[vp_user_id] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [account_type_levels] (
	[org_id] [int] NOT NULL ,
	[type_id] [int] NOT NULL ,
	[level] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [action_item] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[action_id] [int] NOT NULL ,
	[link_item_id] [int] NOT NULL ,
	[completedate] [datetime] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [active_campaign_groups] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[campaign_id] [int] NOT NULL ,
	[groupname] [varchar] (80) NOT NULL ,
	[groupcriteria] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [active_survey] (
	[active_survey_id] [int] IDENTITY (1, 1) NOT NULL ,
	[campaign_id] [int] NOT NULL ,
	[name] [varchar] (80) NOT NULL ,
	[description] [varchar] (255) NULL ,
	[intro] [text] NULL ,
	[outro] [text] NULL ,
	[itemLength] [int] NULL ,
	[type] [int] NOT NULL ,
	[enabled] [bit] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [autoguide_vehicle] (
	[vehicle_id] [int] IDENTITY (1, 1) NOT NULL ,
	[year] [varchar] (4) NOT NULL ,
	[make_id] [int] NOT NULL ,
	[model_id] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_component] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[process_id] [int] NOT NULL ,
	[component_id] [int] NOT NULL ,
	[parent_id] [int] NULL ,
	[parent_result_id] [int] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_events] (
	[event_id] [int] IDENTITY (1, 1) NOT NULL ,
	[second] [varchar] (64) NULL ,
	[minute] [varchar] (64) NULL ,
	[hour] [varchar] (64) NULL ,
	[dayofmonth] [varchar] (64) NULL ,
	[month] [varchar] (64) NULL ,
	[dayofweek] [varchar] (64) NULL ,
	[year] [varchar] (64) NULL ,
	[task] [varchar] (255) NULL ,
	[extrainfo] [varchar] (255) NULL ,
	[businessDays] [varchar] (6) NULL ,
	[enabled] [bit] NULL ,
	[entered] [datetime] NOT NULL ,
	[process_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_hook_triggers] (
	[trigger_id] [int] IDENTITY (1, 1) NOT NULL ,
	[action_type_id] [int] NOT NULL ,
	[hook_id] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_parameter] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[process_id] [int] NOT NULL ,
	[param_name] [varchar] (255) NULL ,
	[param_value] [varchar] (4000) NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [campaign_list_groups] (
	[campaign_id] [int] NOT NULL ,
	[group_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [campaign_run] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[campaign_id] [int] NOT NULL ,
	[status] [int] NOT NULL ,
	[run_date] [datetime] NOT NULL ,
	[total_contacts] [int] NULL ,
	[total_sent] [int] NULL ,
	[total_replied] [int] NULL ,
	[total_bounced] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [campaign_survey_link] (
	[campaign_id] [int] NULL ,
	[survey_id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [contact] (
	[contact_id] [int] IDENTITY (1, 1) NOT NULL ,
	[user_id] [int] NULL ,
	[org_id] [int] NULL ,
	[company] [varchar] (255) NULL ,
	[title] [varchar] (80) NULL ,
	[department] [int] NULL ,
	[super] [int] NULL ,
	[namesalutation] [varchar] (80) NULL ,
	[namelast] [varchar] (80) NOT NULL ,
	[namefirst] [varchar] (80) NOT NULL ,
	[namemiddle] [varchar] (80) NULL ,
	[namesuffix] [varchar] (80) NULL ,
	[assistant] [int] NULL ,
	[birthdate] [datetime] NULL ,
	[notes] [text] NULL ,
	[site] [int] NULL ,
	[imname] [varchar] (30) NULL ,
	[imservice] [int] NULL ,
	[locale] [int] NULL ,
	[employee_id] [varchar] (80) NULL ,
	[employmenttype] [int] NULL ,
	[startofday] [varchar] (10) NULL ,
	[endofday] [varchar] (10) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL ,
	[owner] [int] NULL ,
	[custom1] [int] NULL ,
	[url] [varchar] (100) NULL ,
	[primary_contact] [bit] NULL ,
	[employee] [bit] NULL ,
	[org_name] [varchar] (255) NULL ,
	[access_type] [int] NULL ,
	[status_id] [int] NULL ,
	[import_id] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [custom_field_category] (
	[module_id] [int] NOT NULL ,
	[category_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category_name] [varchar] (255) NOT NULL ,
	[level] [int] NULL ,
	[description] [text] NULL ,
	[start_date] [datetime] NULL ,
	[end_date] [datetime] NULL ,
	[default_item] [bit] NULL ,
	[entered] [datetime] NOT NULL ,
	[enabled] [bit] NULL ,
	[multiple_records] [bit] NULL ,
	[read_only] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [help_contents] (
	[help_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category_id] [int] NULL ,
	[link_module_id] [int] NULL ,
	[module] [varchar] (255) NULL ,
	[section] [varchar] (255) NULL ,
	[subsection] [varchar] (255) NULL ,
	[title] [varchar] (255) NULL ,
	[description] [text] NULL ,
	[nextcontent] [int] NULL ,
	[prevcontent] [int] NULL ,
	[upcontent] [int] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [help_faqs] (
	[faq_id] [int] IDENTITY (1, 1) NOT NULL ,
	[owning_module_id] [int] NOT NULL ,
	[question] [varchar] (1000) NOT NULL ,
	[answer] [varchar] (1000) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[completedate] [datetime] NULL ,
	[completedby] [int] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [news] (
	[rec_id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[url] [text] NULL ,
	[base] [text] NULL ,
	[headline] [text] NULL ,
	[body] [text] NULL ,
	[dateEntered] [datetime] NULL ,
	[type] [char] (1) NULL ,
	[created] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [organization_address] (
	[address_id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[address_type] [int] NULL ,
	[addrline1] [varchar] (80) NULL ,
	[addrline2] [varchar] (80) NULL ,
	[addrline3] [varchar] (80) NULL ,
	[city] [varchar] (80) NULL ,
	[state] [varchar] (80) NULL ,
	[country] [varchar] (80) NULL ,
	[postalcode] [varchar] (12) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [organization_emailaddress] (
	[emailaddress_id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[emailaddress_type] [int] NULL ,
	[email] [varchar] (256) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [organization_phone] (
	[phone_id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[phone_type] [int] NULL ,
	[number] [varchar] (30) NULL ,
	[extension] [varchar] (10) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_catalog] (
	[product_id] [int] IDENTITY (1, 1) NOT NULL ,
	[parent_id] [int] NULL ,
	[product_name] [varchar] (255) NOT NULL ,
	[abbreviation] [varchar] (30) NULL ,
	[short_description] [text] NULL ,
	[long_description] [text] NULL ,
	[type_id] [int] NULL ,
	[special_notes] [varchar] (255) NULL ,
	[sku] [varchar] (40) NULL ,
	[in_stock] [bit] NOT NULL ,
	[format_id] [int] NULL ,
	[shipping_id] [int] NULL ,
	[estimated_ship_time] [int] NULL ,
	[thumbnail_image_id] [int] NULL ,
	[small_image_id] [int] NULL ,
	[large_image_id] [int] NULL ,
	[list_order] [int] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[start_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [product_category] (
	[category_id] [int] IDENTITY (1, 1) NOT NULL ,
	[parent_id] [int] NULL ,
	[category_name] [varchar] (255) NOT NULL ,
	[abbreviation] [varchar] (30) NULL ,
	[short_description] [text] NULL ,
	[long_description] [text] NULL ,
	[type_id] [int] NULL ,
	[thumbnail_image_id] [int] NULL ,
	[small_image_id] [int] NULL ,
	[large_image_id] [int] NULL ,
	[list_order] [int] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[start_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [product_option] (
	[option_id] [int] IDENTITY (1, 1) NOT NULL ,
	[configurator_id] [int] NOT NULL ,
	[parent_id] [int] NULL ,
	[short_description] [text] NULL ,
	[long_description] [text] NULL ,
	[allow_customer_configure] [bit] NOT NULL ,
	[allow_user_configure] [bit] NOT NULL ,
	[required] [bit] NOT NULL ,
	[start_date] [datetime] NULL ,
	[end_date] [datetime] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [project_files_download] (
	[item_id] [int] NOT NULL ,
	[version] [float] NULL ,
	[user_download_id] [int] NULL ,
	[download_date] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [project_files_version] (
	[item_id] [int] NULL ,
	[client_filename] [varchar] (255) NOT NULL ,
	[filename] [varchar] (255) NOT NULL ,
	[subject] [varchar] (500) NOT NULL ,
	[size] [int] NULL ,
	[version] [float] NULL ,
	[enabled] [bit] NULL ,
	[downloads] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [project_issues] (
	[issue_id] [int] IDENTITY (1, 1) NOT NULL ,
	[project_id] [int] NOT NULL ,
	[type_id] [int] NULL ,
	[subject] [varchar] (255) NOT NULL ,
	[message] [text] NOT NULL ,
	[importance] [int] NULL ,
	[enabled] [bit] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [project_requirements] (
	[requirement_id] [int] IDENTITY (1, 1) NOT NULL ,
	[project_id] [int] NOT NULL ,
	[submittedBy] [varchar] (50) NULL ,
	[departmentBy] [varchar] (30) NULL ,
	[shortDescription] [varchar] (255) NOT NULL ,
	[description] [text] NOT NULL ,
	[dateReceived] [datetime] NULL ,
	[estimated_loevalue] [int] NULL ,
	[estimated_loetype] [int] NULL ,
	[actual_loevalue] [int] NULL ,
	[actual_loetype] [int] NULL ,
	[deadline] [datetime] NULL ,
	[approvedBy] [int] NULL ,
	[approvalDate] [datetime] NULL ,
	[closedBy] [int] NULL ,
	[closeDate] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [project_team] (
	[project_id] [int] NOT NULL ,
	[user_id] [int] NOT NULL ,
	[userLevel] [int] NULL ,
	[entered] [datetime] NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [report] (
	[report_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category_id] [int] NOT NULL ,
	[permission_id] [int] NULL ,
	[filename] [varchar] (300) NOT NULL ,
	[type] [int] NOT NULL ,
	[title] [varchar] (300) NOT NULL ,
	[description] [varchar] (1024) NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NOT NULL ,
	[custom] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [revenue] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[transaction_id] [int] NULL ,
	[month] [int] NULL ,
	[year] [int] NULL ,
	[amount] [float] NULL ,
	[type] [int] NULL ,
	[owner] [int] NULL ,
	[description] [varchar] (255) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [role_permission] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[role_id] [int] NOT NULL ,
	[permission_id] [int] NOT NULL ,
	[role_view] [bit] NOT NULL ,
	[role_add] [bit] NOT NULL ,
	[role_edit] [bit] NOT NULL ,
	[role_delete] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [saved_criteriaelement] (
	[id] [int] NOT NULL ,
	[field] [int] NOT NULL ,
	[operator] [varchar] (50) NOT NULL ,
	[operatorid] [int] NOT NULL ,
	[value] [varchar] (80) NOT NULL ,
	[source] [int] NOT NULL ,
	[value_id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [survey_questions] (
	[question_id] [int] IDENTITY (1, 1) NOT NULL ,
	[survey_id] [int] NOT NULL ,
	[type] [int] NOT NULL ,
	[description] [varchar] (255) NULL ,
	[required] [bit] NOT NULL ,
	[position] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sync_conflict_log] (
	[client_id] [int] NOT NULL ,
	[table_id] [int] NOT NULL ,
	[record_id] [int] NOT NULL ,
	[status_date] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sync_map] (
	[client_id] [int] NOT NULL ,
	[table_id] [int] NOT NULL ,
	[record_id] [int] NOT NULL ,
	[cuid] [int] NOT NULL ,
	[complete] [bit] NULL ,
	[status_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sync_transaction_log] (
	[transaction_id] [int] IDENTITY (1, 1) NOT NULL ,
	[log_id] [int] NOT NULL ,
	[reference_id] [varchar] (50) NULL ,
	[element_name] [varchar] (255) NULL ,
	[action] [varchar] (20) NULL ,
	[link_item_id] [int] NULL ,
	[status_code] [int] NULL ,
	[record_count] [int] NULL ,
	[message] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [taskcategory_project] (
	[category_id] [int] NOT NULL ,
	[project_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [tasklink_project] (
	[task_id] [int] NOT NULL ,
	[project_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [viewpoint_permission] (
	[vp_permission_id] [int] IDENTITY (1, 1) NOT NULL ,
	[viewpoint_id] [int] NOT NULL ,
	[permission_id] [int] NOT NULL ,
	[viewpoint_view] [bit] NOT NULL ,
	[viewpoint_add] [bit] NOT NULL ,
	[viewpoint_edit] [bit] NOT NULL ,
	[viewpoint_delete] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [action_item_log] (
	[log_id] [int] IDENTITY (1, 1) NOT NULL ,
	[item_id] [int] NOT NULL ,
	[link_item_id] [int] NULL ,
	[type] [int] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [active_survey_questions] (
	[question_id] [int] IDENTITY (1, 1) NOT NULL ,
	[active_survey_id] [int] NULL ,
	[type] [int] NOT NULL ,
	[description] [varchar] (255) NULL ,
	[required] [bit] NOT NULL ,
	[position] [int] NOT NULL ,
	[average] [float] NULL ,
	[total1] [int] NULL ,
	[total2] [int] NULL ,
	[total3] [int] NULL ,
	[total4] [int] NULL ,
	[total5] [int] NULL ,
	[total6] [int] NULL ,
	[total7] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [active_survey_responses] (
	[response_id] [int] IDENTITY (1, 1) NOT NULL ,
	[active_survey_id] [int] NOT NULL ,
	[contact_id] [int] NOT NULL ,
	[unique_code] [varchar] (255) NULL ,
	[ip_address] [varchar] (15) NOT NULL ,
	[entered] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [autoguide_inventory] (
	[inventory_id] [int] IDENTITY (1, 1) NOT NULL ,
	[vehicle_id] [int] NOT NULL ,
	[account_id] [int] NULL ,
	[vin] [varchar] (20) NULL ,
	[mileage] [varchar] (20) NULL ,
	[is_new] [bit] NULL ,
	[condition] [varchar] (20) NULL ,
	[comments] [varchar] (255) NULL ,
	[stock_no] [varchar] (20) NULL ,
	[ext_color] [varchar] (20) NULL ,
	[int_color] [varchar] (20) NULL ,
	[style] [varchar] (40) NULL ,
	[invoice_price] [float] NULL ,
	[selling_price] [float] NULL ,
	[selling_price_text] [varchar] (100) NULL ,
	[sold] [bit] NULL ,
	[status] [varchar] (20) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_component_parameter] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[component_id] [int] NOT NULL ,
	[parameter_id] [int] NOT NULL ,
	[param_value] [varchar] (4000) NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [business_process_hook] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[trigger_id] [int] NOT NULL ,
	[process_id] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [cfsinbox_messagelink] (
	[id] [int] NOT NULL ,
	[sent_to] [int] NOT NULL ,
	[status] [int] NOT NULL ,
	[viewed] [datetime] NULL ,
	[enabled] [bit] NOT NULL ,
	[sent_from] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [contact_address] (
	[address_id] [int] IDENTITY (1, 1) NOT NULL ,
	[contact_id] [int] NULL ,
	[address_type] [int] NULL ,
	[addrline1] [varchar] (80) NULL ,
	[addrline2] [varchar] (80) NULL ,
	[addrline3] [varchar] (80) NULL ,
	[city] [varchar] (80) NULL ,
	[state] [varchar] (80) NULL ,
	[country] [varchar] (80) NULL ,
	[postalcode] [varchar] (12) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [contact_emailaddress] (
	[emailaddress_id] [int] IDENTITY (1, 1) NOT NULL ,
	[contact_id] [int] NULL ,
	[emailaddress_type] [int] NULL ,
	[email] [varchar] (256) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[primary_email] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [contact_phone] (
	[phone_id] [int] IDENTITY (1, 1) NOT NULL ,
	[contact_id] [int] NULL ,
	[phone_type] [int] NULL ,
	[number] [varchar] (30) NULL ,
	[extension] [varchar] (10) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [contact_type_levels] (
	[contact_id] [int] NOT NULL ,
	[type_id] [int] NOT NULL ,
	[level] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [custom_field_group] (
	[category_id] [int] NOT NULL ,
	[group_id] [int] IDENTITY (1, 1) NOT NULL ,
	[group_name] [varchar] (255) NOT NULL ,
	[level] [int] NULL ,
	[description] [text] NULL ,
	[start_date] [datetime] NULL ,
	[end_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [custom_field_record] (
	[link_module_id] [int] NOT NULL ,
	[link_item_id] [int] NOT NULL ,
	[category_id] [int] NOT NULL ,
	[record_id] [int] IDENTITY (1, 1) NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [excluded_recipient] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[campaign_id] [int] NOT NULL ,
	[contact_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [help_business_rules] (
	[rule_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_help_id] [int] NOT NULL ,
	[description] [varchar] (1000) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[completedate] [datetime] NULL ,
	[completedby] [int] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [help_features] (
	[feature_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_help_id] [int] NOT NULL ,
	[link_feature_id] [int] NULL ,
	[description] [varchar] (1000) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[completedate] [datetime] NULL ,
	[completedby] [int] NULL ,
	[enabled] [bit] NOT NULL ,
	[level] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [help_notes] (
	[note_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_help_id] [int] NOT NULL ,
	[description] [varchar] (1000) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[completedate] [datetime] NULL ,
	[completedby] [int] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [help_related_links] (
	[relatedlink_id] [int] IDENTITY (1, 1) NOT NULL ,
	[owning_module_id] [int] NULL ,
	[linkto_content_id] [int] NULL ,
	[displaytext] [varchar] (255) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [help_tableofcontentitem_links] (
	[link_id] [int] IDENTITY (1, 1) NOT NULL ,
	[global_link_id] [int] NOT NULL ,
	[linkto_content_id] [int] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [help_tips] (
	[tip_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_help_id] [int] NOT NULL ,
	[description] [varchar] (1000) NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [opportunity_header] (
	[opp_id] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (80) NULL ,
	[acctlink] [int] NULL ,
	[contactlink] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [package] (
	[package_id] [int] IDENTITY (1, 1) NOT NULL ,
	[category_id] [int] NULL ,
	[package_name] [varchar] (255) NOT NULL ,
	[abbreviation] [varchar] (30) NULL ,
	[short_description] [text] NULL ,
	[long_description] [text] NULL ,
	[thumbnail_image_id] [int] NULL ,
	[small_image_id] [int] NULL ,
	[large_image_id] [int] NULL ,
	[list_order] [int] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[start_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL ,
	[enabled] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [product_catalog_category_map] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[product_id] [int] NOT NULL ,
	[category_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_catalog_pricing] (
	[price_id] [int] IDENTITY (1, 1) NOT NULL ,
	[product_id] [int] NULL ,
	[tax_id] [int] NULL ,
	[msrp_currency] [int] NULL ,
	[msrp_amount] [float] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[recurring_currency] [int] NULL ,
	[recurring_amount] [float] NOT NULL ,
	[recurring_type] [int] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[start_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_category_map] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[category1_id] [int] NOT NULL ,
	[category2_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_keyword_map] (
	[product_id] [int] NOT NULL ,
	[keyword_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_option_boolean] (
	[product_option_id] [int] NOT NULL ,
	[value] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_option_float] (
	[product_option_id] [int] NOT NULL ,
	[value] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_option_integer] (
	[product_option_id] [int] NOT NULL ,
	[value] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_option_text] (
	[product_option_id] [int] NOT NULL ,
	[value] [text] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [product_option_timestamp] (
	[product_option_id] [int] NOT NULL ,
	[value] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [product_option_values] (
	[value_id] [int] IDENTITY (1, 1) NOT NULL ,
	[option_id] [int] NOT NULL ,
	[result_id] [int] NOT NULL ,
	[description] [text] NULL ,
	[msrp_currency] [int] NULL ,
	[msrp_amount] [float] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[recurring_currency] [int] NULL ,
	[recurring_amount] [float] NOT NULL ,
	[recurring_type] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [project_assignments] (
	[assignment_id] [int] IDENTITY (1, 1) NOT NULL ,
	[project_id] [int] NOT NULL ,
	[requirement_id] [int] NULL ,
	[assignedBy] [int] NULL ,
	[user_assign_id] [int] NULL ,
	[activity_id] [int] NULL ,
	[technology] [varchar] (50) NULL ,
	[role] [varchar] (255) NULL ,
	[estimated_loevalue] [int] NULL ,
	[estimated_loetype] [int] NULL ,
	[actual_loevalue] [int] NULL ,
	[actual_loetype] [int] NULL ,
	[priority_id] [int] NULL ,
	[assign_date] [datetime] NULL ,
	[est_start_date] [datetime] NULL ,
	[start_date] [datetime] NULL ,
	[due_date] [datetime] NULL ,
	[status_id] [int] NULL ,
	[status_date] [datetime] NOT NULL ,
	[complete_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [project_issue_replies] (
	[reply_id] [int] IDENTITY (1, 1) NOT NULL ,
	[issue_id] [int] NOT NULL ,
	[reply_to] [int] NULL ,
	[subject] [varchar] (50) NOT NULL ,
	[message] [text] NOT NULL ,
	[importance] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredBy] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedBy] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [report_criteria] (
	[criteria_id] [int] IDENTITY (1, 1) NOT NULL ,
	[report_id] [int] NOT NULL ,
	[owner] [int] NOT NULL ,
	[subject] [varchar] (512) NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [report_queue] (
	[queue_id] [int] IDENTITY (1, 1) NOT NULL ,
	[report_id] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[processed] [datetime] NULL ,
	[status] [int] NOT NULL ,
	[filename] [varchar] (256) NULL ,
	[filesize] [int] NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [revenue_detail] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[revenue_id] [int] NULL ,
	[amount] [float] NULL ,
	[type] [int] NULL ,
	[owner] [int] NULL ,
	[description] [varchar] (255) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [scheduled_recipient] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[campaign_id] [int] NOT NULL ,
	[contact_id] [int] NOT NULL ,
	[run_id] [int] NULL ,
	[status_id] [int] NULL ,
	[status] [varchar] (255) NULL ,
	[status_date] [datetime] NULL ,
	[scheduled_date] [datetime] NULL ,
	[sent_date] [datetime] NULL ,
	[reply_date] [datetime] NULL ,
	[bounce_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [service_contract] (
	[contract_id] [int] IDENTITY (1, 1) NOT NULL ,
	[contract_number] [varchar] (30) NULL ,
	[account_id] [int] NOT NULL ,
	[initial_start_date] [datetime] NOT NULL ,
	[current_start_date] [datetime] NULL ,
	[current_end_date] [datetime] NULL ,
	[category] [int] NULL ,
	[type] [int] NULL ,
	[contact_id] [int] NULL ,
	[description] [text] NULL ,
	[contract_billing_notes] [text] NULL ,
	[response_time] [int] NULL ,
	[telephone_service_model] [int] NULL ,
	[onsite_service_model] [int] NULL ,
	[email_service_model] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL ,
	[contract_value] [float] NULL ,
	[total_hours_remaining] [float] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [survey_items] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[question_id] [int] NOT NULL ,
	[type] [int] NULL ,
	[description] [varchar] (255) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [tasklink_contact] (
	[task_id] [int] NOT NULL ,
	[contact_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [active_survey_answers] (
	[answer_id] [int] IDENTITY (1, 1) NOT NULL ,
	[response_id] [int] NOT NULL ,
	[question_id] [int] NOT NULL ,
	[comments] [text] NULL ,
	[quant_ans] [int] NULL ,
	[text_ans] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [active_survey_items] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[question_id] [int] NOT NULL ,
	[type] [int] NULL ,
	[description] [varchar] (255) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [asset] (
	[asset_id] [int] IDENTITY (1, 1) NOT NULL ,
	[account_id] [int] NULL ,
	[contract_id] [int] NULL ,
	[date_listed] [datetime] NULL ,
	[asset_tag] [varchar] (30) NULL ,
	[status] [int] NULL ,
	[location] [varchar] (256) NULL ,
	[level1] [int] NULL ,
	[level2] [int] NULL ,
	[level3] [int] NULL ,
	[vendor] [varchar] (30) NULL ,
	[manufacturer] [varchar] (30) NULL ,
	[serial_number] [varchar] (30) NULL ,
	[model_version] [varchar] (30) NULL ,
	[description] [text] NULL ,
	[expiration_date] [datetime] NULL ,
	[inclusions] [text] NULL ,
	[exclusions] [text] NULL ,
	[purchase_date] [datetime] NULL ,
	[po_number] [varchar] (30) NULL ,
	[purchased_from] [varchar] (30) NULL ,
	[contact_id] [int] NULL ,
	[notes] [text] NULL ,
	[response_time] [int] NULL ,
	[telephone_service_model] [int] NULL ,
	[onsite_service_model] [int] NULL ,
	[email_service_model] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL ,
	[purchase_cost] [float] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [autoguide_ad_run] (
	[ad_run_id] [int] IDENTITY (1, 1) NOT NULL ,
	[inventory_id] [int] NOT NULL ,
	[run_date] [datetime] NOT NULL ,
	[ad_type] [varchar] (20) NULL ,
	[include_photo] [bit] NULL ,
	[complete_date] [datetime] NULL ,
	[completedby] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [autoguide_inventory_options] (
	[inventory_id] [int] NOT NULL ,
	[option_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [call_log] (
	[call_id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[contact_id] [int] NULL ,
	[opp_id] [int] NULL ,
	[call_type_id] [int] NULL ,
	[length] [int] NULL ,
	[subject] [varchar] (255) NULL ,
	[notes] [text] NULL ,
	[followup_date] [datetime] NULL ,
	[alertdate] [datetime] NULL ,
	[followup_notes] [text] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[alert] [varchar] (100) NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [custom_field_info] (
	[group_id] [int] NOT NULL ,
	[field_id] [int] IDENTITY (1, 1) NOT NULL ,
	[field_name] [varchar] (255) NOT NULL ,
	[level] [int] NULL ,
	[field_type] [int] NOT NULL ,
	[validation_type] [int] NULL ,
	[required] [bit] NULL ,
	[parameters] [text] NULL ,
	[start_date] [datetime] NULL ,
	[end_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enabled] [bit] NULL ,
	[additional_text] [varchar] (255) NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [opportunity_component] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[opp_id] [int] NULL ,
	[owner] [int] NOT NULL ,
	[description] [varchar] (80) NULL ,
	[closedate] [datetime] NOT NULL ,
	[closeprob] [float] NULL ,
	[terms] [float] NULL ,
	[units] [char] (1) NULL ,
	[lowvalue] [float] NULL ,
	[guessvalue] [float] NULL ,
	[highvalue] [float] NULL ,
	[stage] [int] NULL ,
	[stagedate] [datetime] NOT NULL ,
	[commission] [float] NULL ,
	[type] [char] (1) NULL ,
	[alertdate] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[closed] [datetime] NULL ,
	[alert] [varchar] (100) NULL ,
	[enabled] [bit] NOT NULL ,
	[notes] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [package_products_map] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[package_id] [int] NOT NULL ,
	[product_id] [int] NOT NULL ,
	[description] [text] NULL ,
	[msrp_currency] [int] NULL ,
	[msrp_amount] [float] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[start_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [product_option_map] (
	[product_option_id] [int] IDENTITY (1, 1) NOT NULL ,
	[product_id] [int] NOT NULL ,
	[option_id] [int] NOT NULL ,
	[value_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [project_assignments_status] (
	[status_id] [int] IDENTITY (1, 1) NOT NULL ,
	[assignment_id] [int] NOT NULL ,
	[user_id] [int] NOT NULL ,
	[description] [text] NOT NULL ,
	[status_date] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [report_criteria_parameter] (
	[parameter_id] [int] IDENTITY (1, 1) NOT NULL ,
	[criteria_id] [int] NOT NULL ,
	[parameter] [varchar] (255) NOT NULL ,
	[value] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [report_queue_criteria] (
	[criteria_id] [int] IDENTITY (1, 1) NOT NULL ,
	[queue_id] [int] NOT NULL ,
	[parameter] [varchar] (255) NOT NULL ,
	[value] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [service_contract_hours] (
	[history_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_contract_id] [int] NULL ,
	[adjustment_hours] [float] NULL ,
	[adjustment_reason] [int] NULL ,
	[adjustment_notes] [text] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [service_contract_products] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_contract_id] [int] NULL ,
	[link_product_id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [active_survey_answer_avg] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[question_id] [int] NOT NULL ,
	[item_id] [int] NOT NULL ,
	[total] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [active_survey_answer_items] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[item_id] [int] NOT NULL ,
	[answer_id] [int] NOT NULL ,
	[comments] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [custom_field_data] (
	[record_id] [int] NOT NULL ,
	[field_id] [int] NOT NULL ,
	[selected_item_id] [int] NULL ,
	[entered_value] [text] NULL ,
	[entered_number] [int] NULL ,
	[entered_float] [float] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [custom_field_lookup] (
	[field_id] [int] NOT NULL ,
	[code] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (255) NOT NULL ,
	[default_item] [bit] NULL ,
	[level] [int] NULL ,
	[start_date] [datetime] NULL ,
	[end_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [opportunity_component_levels] (
	[opp_id] [int] NOT NULL ,
	[type_id] [int] NOT NULL ,
	[level] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [customer_product] (
	[customer_product_id] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NOT NULL ,
	[order_id] [int] NULL ,
	[order_item_id] [int] NULL ,
	[description] [varchar] (2048) NULL ,
	[status_id] [int] NULL ,
	[status_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [customer_product_history] (
	[history_id] [int] IDENTITY (1, 1) NOT NULL ,
	[customer_product_id] [int] NOT NULL ,
	[org_id] [int] NOT NULL ,
	[order_id] [int] NULL ,
	[product_start_date] [datetime] NULL ,
	[product_end_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_address] (
	[address_id] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NOT NULL ,
	[address_type] [int] NULL ,
	[addrline1] [varchar] (300) NULL ,
	[addrline2] [varchar] (300) NULL ,
	[addrline3] [varchar] (300) NULL ,
	[city] [varchar] (300) NULL ,
	[state] [varchar] (300) NULL ,
	[country] [varchar] (300) NULL ,
	[postalcode] [varchar] (40) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_entry] (
	[order_id] [int] IDENTITY (1, 1) NOT NULL ,
	[parent_id] [int] NULL ,
	[org_id] [int] NOT NULL ,
	[quote_id] [int] NULL ,
	[sales_id] [int] NULL ,
	[orderedby] [int] NULL ,
	[billing_contact_id] [int] NULL ,
	[source_id] [int] NULL ,
	[grand_total] [float] NULL ,
	[status_id] [int] NULL ,
	[status_date] [datetime] NULL ,
	[contract_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL ,
	[order_terms_id] [int] NULL ,
	[order_type_id] [int] NULL ,
	[description] [varchar] (2048) NULL ,
	[notes] [text] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [order_payment] (
	[payment_id] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NOT NULL ,
	[payment_method_id] [int] NOT NULL ,
	[payment_amount] [float] NULL ,
	[authorization_ref_number] [varchar] (30) NULL ,
	[authorization_code] [varchar] (30) NULL ,
	[authorization_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NOT NULL ,
	[product_id] [int] NOT NULL ,
	[quantity] [int] NOT NULL ,
	[msrp_currency] [int] NULL ,
	[msrp_amount] [float] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[recurring_currency] [int] NULL ,
	[recurring_amount] [float] NOT NULL ,
	[recurring_type] [int] NULL ,
	[extended_price] [float] NOT NULL ,
	[total_price] [float] NOT NULL ,
	[status_id] [int] NULL ,
	[status_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product_option_boolean] (
	[order_product_option_id] [int] NULL ,
	[value] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product_option_float] (
	[order_product_option_id] [int] NULL ,
	[value] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product_option_integer] (
	[order_product_option_id] [int] NULL ,
	[value] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product_option_text] (
	[order_product_option_id] [int] NULL ,
	[value] [text] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [order_product_option_timestamp] (
	[order_product_option_id] [int] NULL ,
	[value] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product_options] (
	[order_product_option_id] [int] IDENTITY (1, 1) NOT NULL ,
	[item_id] [int] NOT NULL ,
	[product_option_id] [int] NOT NULL ,
	[quantity] [int] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[recurring_currency] [int] NULL ,
	[recurring_amount] [float] NOT NULL ,
	[recurring_type] [int] NULL ,
	[extended_price] [float] NOT NULL ,
	[total_price] [float] NOT NULL ,
	[status_id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [order_product_status] (
	[order_product_status_id] [int] IDENTITY (1, 1) NOT NULL ,
	[order_id] [int] NOT NULL ,
	[item_id] [int] NOT NULL ,
	[status_id] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [payment_creditcard] (
	[creditcard_id] [int] IDENTITY (1, 1) NOT NULL ,
	[payment_id] [int] NOT NULL ,
	[card_type] [int] NULL ,
	[card_number] [varchar] (300) NULL ,
	[card_security_code] [varchar] (300) NULL ,
	[expiration_month] [int] NULL ,
	[expiration_year] [int] NULL ,
	[name_on_card] [varchar] (300) NULL ,
	[company_name_on_card] [varchar] (300) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [payment_eft] (
	[bank_id] [int] IDENTITY (1, 1) NOT NULL ,
	[payment_id] [int] NOT NULL ,
	[bank_name] [varchar] (300) NULL ,
	[routing_number] [varchar] (300) NULL ,
	[account_number] [varchar] (300) NULL ,
	[name_on_account] [varchar] (300) NULL ,
	[company_name_on_account] [varchar] (300) NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [quote_entry] (
	[quote_id] [int] IDENTITY (1, 1) NOT NULL ,
	[parent_id] [int] NULL ,
	[org_id] [int] NOT NULL ,
	[contact_id] [int] NULL ,
	[source_id] [int] NULL ,
	[grand_total] [float] NULL ,
	[status_id] [int] NULL ,
	[status_date] [datetime] NULL ,
	[expiration_date] [datetime] NULL ,
	[quote_terms_id] [int] NULL ,
	[quote_type_id] [int] NULL ,
	[issued] [datetime] NULL ,
	[short_description] [text] NULL ,
	[notes] [text] NULL ,
	[ticketid] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[product_id] [int] NULL ,
	[customer_product_id] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [quote_notes] (
	[notes_id] [int] IDENTITY (1, 1) NOT NULL ,
	[quote_id] [int] NULL ,
	[notes] [text] NULL ,
	[enteredby] [int] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [quote_product] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[quote_id] [int] NOT NULL ,
	[product_id] [int] NOT NULL ,
	[quantity] [int] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[recurring_currency] [int] NULL ,
	[recurring_amount] [float] NOT NULL ,
	[recurring_type] [int] NULL ,
	[extended_price] [float] NOT NULL ,
	[total_price] [float] NOT NULL ,
	[estimated_delivery_date] [datetime] NULL ,
	[status_id] [int] NULL ,
	[status_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [quote_product_option_boolean] (
	[quote_product_option_id] [int] NULL ,
	[value] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [quote_product_option_float] (
	[quote_product_option_id] [int] NULL ,
	[value] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [quote_product_option_integer] (
	[quote_product_option_id] [int] NULL ,
	[value] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [quote_product_option_text] (
	[quote_product_option_id] [int] NULL ,
	[value] [text] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [quote_product_option_timestamp] (
	[quote_product_option_id] [int] NULL ,
	[value] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [quote_product_options] (
	[quote_product_option_id] [int] IDENTITY (1, 1) NOT NULL ,
	[item_id] [int] NOT NULL ,
	[product_option_id] [int] NOT NULL ,
	[quantity] [int] NOT NULL ,
	[price_currency] [int] NULL ,
	[price_amount] [float] NOT NULL ,
	[recurring_currency] [int] NULL ,
	[recurring_amount] [float] NOT NULL ,
	[recurring_type] [int] NULL ,
	[extended_price] [float] NOT NULL ,
	[total_price] [float] NOT NULL ,
	[status_id] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [tasklink_ticket] (
	[task_id] [int] NOT NULL ,
	[ticket_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ticket] (
	[ticketid] [int] IDENTITY (1, 1) NOT NULL ,
	[org_id] [int] NULL ,
	[contact_id] [int] NULL ,
	[problem] [text] NOT NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[closed] [datetime] NULL ,
	[pri_code] [int] NULL ,
	[level_code] [int] NULL ,
	[department_code] [int] NULL ,
	[source_code] [int] NULL ,
	[cat_code] [int] NULL ,
	[subcat_code1] [int] NULL ,
	[subcat_code2] [int] NULL ,
	[subcat_code3] [int] NULL ,
	[assigned_to] [int] NULL ,
	[comment] [text] NULL ,
	[solution] [text] NULL ,
	[scode] [int] NULL ,
	[critical] [datetime] NULL ,
	[notified] [datetime] NULL ,
	[custom_data] [text] NULL ,
	[location] [varchar] (256) NULL ,
	[assigned_date] [datetime] NULL ,
	[est_resolution_date] [datetime] NULL ,
	[resolution_date] [datetime] NULL ,
	[cause] [text] NULL ,
	[link_contract_id] [int] NULL ,
	[link_asset_id] [int] NULL ,
	[product_id] [int] NULL ,
	[customer_product_id] [int] NULL ,
	[expectation] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ticket_activity_item] (
	[item_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_form_id] [int] NULL ,
	[activity_date] [datetime] NULL ,
	[description] [text] NULL ,
	[travel_hours] [int] NULL ,
	[travel_minutes] [int] NULL ,
	[labor_hours] [int] NULL ,
	[labor_minutes] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ticket_csstm_form] (
	[form_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_ticket_id] [int] NULL ,
	[phone_response_time] [varchar] (10) NULL ,
	[engineer_response_time] [varchar] (10) NULL ,
	[follow_up_required] [bit] NULL ,
	[follow_up_description] [varchar] (2048) NULL ,
	[alert_date] [datetime] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL ,
	[travel_towards_sc] [bit] NULL ,
	[labor_towards_sc] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ticket_sun_form] (
	[form_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_ticket_id] [int] NULL ,
	[description_of_service] [text] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL ,
	[enabled] [bit] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ticketlog] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ticketid] [int] NULL ,
	[assigned_to] [int] NULL ,
	[comment] [text] NULL ,
	[closed] [bit] NULL ,
	[pri_code] [int] NULL ,
	[level_code] [int] NULL ,
	[department_code] [int] NULL ,
	[cat_code] [int] NULL ,
	[scode] [int] NULL ,
	[entered] [datetime] NOT NULL ,
	[enteredby] [int] NOT NULL ,
	[modified] [datetime] NOT NULL ,
	[modifiedby] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [trouble_asset_replacement] (
	[replacement_id] [int] IDENTITY (1, 1) NOT NULL ,
	[link_form_id] [int] NULL ,
	[part_number] [varchar] (256) NULL ,
	[part_description] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [access] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[user_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [asset_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [asset_category_draft] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_ad_run_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_make] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[make_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_options] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[option_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_component_library] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[component_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_parameter_library] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[parameter_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [database_version] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[version_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [field_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_access_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_account_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_asset_status] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_call_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_contactaddress_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_contactemail_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_contactphone_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_creditcard_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_currency] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_delivery_options] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_department] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_email_model] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_employment_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_help_features] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_hours_reason] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_industry] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_instantmessenger_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_locale] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_onsite_model] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_opportunity_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_order_source] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_order_status] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_order_terms] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_order_type] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_orderaddress_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_orgaddress_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_orgemail_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_orgphone_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_payment_methods] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_phone_model] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_category_type] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_conf_result] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_format] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_keyword] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_ship_time] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_shipping] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_tax] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_product_type] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_project_activity] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_project_issues] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_project_loe] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_project_priority] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_project_status] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_quote_source] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_quote_status] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_quote_terms] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_quote_type] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_recurring_type] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_response_model] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_revenue_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_revenuedetail_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_sc_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_sc_type] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_stage] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_survey_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_task_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_task_loe] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_task_priority] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_ticketsource] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [notification] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[notification_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [permission_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[category_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_folders] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[folder_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [search_fields] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [state] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[state_code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [sync_client] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[client_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [sync_system] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[system_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_category_draft] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_level] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_priority] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_severity] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [usage_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[usage_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [access_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [action_list] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[action_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_model] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[model_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[process_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_component_result_lookup] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[result_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_hook_library] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[hook_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [campaign] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[campaign_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [category_editor_lookup] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [cfsinbox_message] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_module] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[module_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_tableof_contents] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[content_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [import] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[import_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_contact_types] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [lookup_lists_lookup] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [message] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [message_template] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [module_field_categorylink] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [organization] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[org_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [permission] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[permission_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [process_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[process_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_option_configurator] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[configurator_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_files] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [projects] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[project_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [role] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[role_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [saved_criterialist] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [survey] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[survey_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [sync_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[log_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [sync_table] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[table_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [task] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[task_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [viewpoint] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[viewpoint_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [action_item] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_campaign_groups] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[active_survey_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_vehicle] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[vehicle_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_component] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_events] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[event_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_hook_triggers] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[trigger_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_parameter] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [campaign_run] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [contact] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[contact_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [custom_field_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[category_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_contents] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[help_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_faqs] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[faq_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [news] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[rec_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [organization_address] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[address_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [organization_emailaddress] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[emailaddress_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [organization_phone] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[phone_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_catalog] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[product_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_category] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[category_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_option] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[option_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_issues] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[issue_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_requirements] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[requirement_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [report] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[report_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [revenue] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [role_permission] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [survey_questions] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[question_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [sync_transaction_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[transaction_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [viewpoint_permission] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[vp_permission_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [action_item_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[log_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey_questions] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[question_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey_responses] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[response_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_inventory] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[inventory_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_component_parameter] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_hook] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [contact_address] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[address_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [contact_emailaddress] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[emailaddress_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [contact_phone] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[phone_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [custom_field_group] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[group_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [custom_field_record] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[record_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [excluded_recipient] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_business_rules] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[rule_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_features] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[feature_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_notes] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[note_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_related_links] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[relatedlink_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_tableofcontentitem_links] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[link_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [help_tips] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[tip_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [opportunity_header] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[opp_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [package] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[package_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_catalog_category_map] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_catalog_pricing] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[price_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_category_map] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_option_values] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[value_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_assignments] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[assignment_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_issue_replies] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[reply_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [report_criteria] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[criteria_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [report_queue] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[queue_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [revenue_detail] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [scheduled_recipient] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [service_contract] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[contract_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [survey_items] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey_answers] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[answer_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey_items] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [asset] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[asset_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [autoguide_ad_run] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ad_run_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [call_log] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[call_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [custom_field_info] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[field_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [opportunity_component] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [package_products_map] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [product_option_map] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[product_option_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [project_assignments_status] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[status_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [report_criteria_parameter] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[parameter_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [report_queue_criteria] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[criteria_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [service_contract_hours] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[history_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [service_contract_products] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey_answer_avg] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [active_survey_answer_items] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [custom_field_lookup] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [customer_product] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[customer_product_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [customer_product_history] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[history_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [order_address] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[address_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [order_entry] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[order_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [order_payment] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[payment_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [order_product] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [order_product_options] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[order_product_option_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [order_product_status] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[order_product_status_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [payment_creditcard] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[creditcard_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [payment_eft] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[bank_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [quote_entry] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[quote_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [quote_notes] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[notes_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [quote_product] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [quote_product_options] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[quote_product_option_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ticketid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_activity_item] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[item_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_csstm_form] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[form_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_sun_form] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[form_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticketlog] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [trouble_asset_replacement] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[replacement_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [access] WITH NOCHECK ADD 
	CONSTRAINT [DF__access__contact___77BFCB91] DEFAULT ((-1)) FOR [contact_id],
	CONSTRAINT [DF__access__role_id__78B3EFCA] DEFAULT ((-1)) FOR [role_id],
	CONSTRAINT [DF__access__manager___79A81403] DEFAULT ((-1)) FOR [manager_id],
	CONSTRAINT [DF__access__startofd__7A9C383C] DEFAULT (8) FOR [startofday],
	CONSTRAINT [DF__access__endofday__7B905C75] DEFAULT (18) FOR [endofday],
	CONSTRAINT [DF__access__timezone__7C8480AE] DEFAULT ('America/New_York') FOR [timezone],
	CONSTRAINT [DF__access__last_log__7D78A4E7] DEFAULT (getdate()) FOR [last_login],
	CONSTRAINT [DF__access__entered__7E6CC920] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__access__modified__7F60ED59] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__access__expires__00551192] DEFAULT (null) FOR [expires],
	CONSTRAINT [DF__access__alias__014935CB] DEFAULT ((-1)) FOR [alias],
	CONSTRAINT [DF__access__assistan__023D5A04] DEFAULT ((-1)) FOR [assistant],
	CONSTRAINT [DF__access__enabled__03317E3D] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [asset_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__asset_cat__cat_l__53385258] DEFAULT (0) FOR [cat_level],
	CONSTRAINT [DF__asset_cat__full___542C7691] DEFAULT ('') FOR [full_description],
	CONSTRAINT [DF__asset_cat__defau__55209ACA] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__asset_cat__level__5614BF03] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__asset_cat__enabl__5708E33C] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [asset_category_draft] WITH NOCHECK ADD 
	CONSTRAINT [DF__asset_cat__link___59E54FE7] DEFAULT ((-1)) FOR [link_id],
	CONSTRAINT [DF__asset_cat__cat_l__5AD97420] DEFAULT (0) FOR [cat_level],
	CONSTRAINT [DF__asset_cat__full___5BCD9859] DEFAULT ('') FOR [full_description],
	CONSTRAINT [DF__asset_cat__defau__5CC1BC92] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__asset_cat__level__5DB5E0CB] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__asset_cat__enabl__5EAA0504] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [autoguide_ad_run_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__defau__1AA9E072] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__autoguide__level__1B9E04AB] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__autoguide__enabl__1C9228E4] DEFAULT (0) FOR [enabled],
	CONSTRAINT [DF__autoguide__enter__1D864D1D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__1E7A7156] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [autoguide_make] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__enter__75785BC3] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__766C7FFC] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [autoguide_options] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__defau__0B679CE2] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__autoguide__level__0C5BC11B] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__autoguide__enabl__0D4FE554] DEFAULT (0) FOR [enabled],
	CONSTRAINT [DF__autoguide__enter__0E44098D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__0F382DC6] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [business_process_component_library] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__66F53242] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [business_process_log] WITH NOCHECK ADD 
	 UNIQUE  NONCLUSTERED 
	(
		[process_name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_parameter_library] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__6E96540A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [database_version] WITH NOCHECK ADD 
	CONSTRAINT [DF__database___enter__4A4E069C] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [field_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__field_typ__data___5AF96FB1] DEFAULT ((-1)) FOR [data_typeid],
	CONSTRAINT [DF__field_typ__enabl__5BED93EA] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_access_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ac__defau__4E88ABD4] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ac__enabl__4F7CD00D] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_account_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ac__defau__182C9B23] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ac__level__1920BF5C] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_ac__enabl__1A14E395] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_asset_status] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_as__defau__1AF3F935] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_as__enabl__1BE81D6E] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_call_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ca__defau__4D2A7347] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ca__level__4E1E9780] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_ca__enabl__4F12BBB9] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_contactaddress_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_co__defau__403A8C7D] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_co__level__412EB0B6] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_co__enabl__4222D4EF] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_contactemail_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_co__defau__44FF419A] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_co__level__45F365D3] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_co__enabl__46E78A0C] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_contactphone_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_co__defau__49C3F6B7] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_co__level__4AB81AF0] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_co__enabl__4BAC3F29] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_creditcard_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_cr__defau__79E80B25] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_cr__level__7ADC2F5E] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_cr__enabl__7BD05397] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_currency] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_cu__defau__7132C993] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_cu__level__7226EDCC] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_cu__enabl__731B1205] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_delivery_options] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_de__defau__1DB06A4F] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_de__level__1EA48E88] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_de__enabl__1F98B2C1] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_department] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_de__defau__1ED998B2] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_de__level__1FCDBCEB] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_de__enabl__20C1E124] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_email_model] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_em__defau__31D75E8D] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_em__enabl__32CB82C6] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_employment_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_em__defau__36B12243] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_em__level__37A5467C] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_em__enabl__38996AB5] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_help_features] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_he__defau__18F6A22A] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_he__level__19EAC663] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_he__enabl__1ADEEA9C] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_hours_reason] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ho__defau__35A7EF71] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ho__enabl__369C13AA] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_industry] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_in__defau__060DEAE8] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_in__level__07020F21] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_in__enabl__07F6335A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_instantmessenger_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_in__defau__31EC6D26] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_in__level__32E0915F] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_in__enabl__33D4B598] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_locale] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_lo__defau__3B75D760] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_lo__level__3C69FB99] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_lo__enabl__3D5E1FD2] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_onsite_model] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_on__defau__2E06CDA9] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_on__enabl__2EFAF1E2] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_opportunity_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_op__defau__51EF2864] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_op__level__52E34C9D] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_op__enabl__53D770D6] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_order_source] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__24134F1B] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__25077354] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__25FB978D] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_order_status] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__15C52FC4] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__16B953FD] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__17AD7836] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_order_terms] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__1F4E99FE] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__2042BE37] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__2136E270] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_order_type] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__1A89E4E1] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__1B7E091A] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__1C722D53] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_orderaddress_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__68BD7F23] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__69B1A35C] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__6AA5C795] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_orgaddress_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__239E4DCF] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__24927208] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__25869641] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_orgemail_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__286302EC] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__29572725] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__2A4B4B5E] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_orgphone_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_or__defau__2D27B809] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_or__level__2E1BDC42] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_or__enabl__2F10007B] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_payment_methods] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pa__defau__75235608] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pa__level__76177A41] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pa__enabl__770B9E7A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_phone_model] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ph__defau__2A363CC5] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ph__enabl__2B2A60FE] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_category_type] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__75F77EB0] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__76EBA2E9] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__77DFC722] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_conf_result] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__6A50C1DA] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__6B44E613] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__6C390A4C] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_format] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__119F9925] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__1293BD5E] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__1387E197] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_keyword] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__1352D76D] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__1446FBA6] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__153B1FDF] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_ship_time] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__1B29035F] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__1C1D2798] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__1D114BD1] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_shipping] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__16644E42] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__1758727B] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__184C96B4] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_tax] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__1FEDB87C] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__20E1DCB5] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__21D600EE] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_product_type] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__0CDAE408] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__0DCF0841] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__0EC32C7A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_project_activity] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__7908F585] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__79FD19BE] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__7AF13DF7] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__lookup_pr__group__7BE56230] DEFAULT (0) FOR [group_id],
	CONSTRAINT [DF__lookup_pr__templ__7CD98669] DEFAULT (0) FOR [template_id]
GO

ALTER TABLE [lookup_project_issues] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__056ECC6A] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__0662F0A3] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__075714DC] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__lookup_pr__group__084B3915] DEFAULT (0) FOR [group_id]
GO

ALTER TABLE [lookup_project_loe] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__base___10E07F16] DEFAULT (0) FOR [base_value],
	CONSTRAINT [DF__lookup_pr__defau__11D4A34F] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__12C8C788] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__13BCEBC1] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__lookup_pr__group__14B10FFA] DEFAULT (0) FOR [group_id]
GO

ALTER TABLE [lookup_project_priority] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__7FB5F314] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__00AA174D] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__019E3B86] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__lookup_pr__group__02925FBF] DEFAULT (0) FOR [group_id]
GO

ALTER TABLE [lookup_project_status] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_pr__defau__0B27A5C0] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_pr__level__0C1BC9F9] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_pr__enabl__0D0FEE32] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__lookup_pr__group__0E04126B] DEFAULT (0) FOR [group_id]
GO

ALTER TABLE [lookup_quote_source] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_qu__defau__5D80D6A1] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_qu__level__5E74FADA] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_qu__enabl__5F691F13] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_quote_status] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_qu__defau__4F32B74A] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_qu__level__5026DB83] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_qu__enabl__511AFFBC] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_quote_terms] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_qu__defau__58BC2184] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_qu__level__59B045BD] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_qu__enabl__5AA469F6] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_quote_type] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_qu__defau__53F76C67] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_qu__level__54EB90A0] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_qu__enabl__55DFB4D9] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_recurring_type] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_re__defau__24B26D99] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_re__level__25A691D2] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_re__enabl__269AB60B] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_response_model] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_re__defau__2665ABE1] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_re__enabl__2759D01A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_revenue_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_re__defau__2156DE01] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_re__level__224B023A] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_re__enabl__233F2673] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_revenuedetail_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_re__defau__261B931E] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_re__level__270FB757] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_re__enabl__2803DB90] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_sc_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_sc__defau__1EC48A19] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_sc__enabl__1FB8AE52] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_sc_type] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_sc__defau__22951AFD] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_sc__enabl__23893F36] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_stage] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_st__defau__18EBB532] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_st__level__19DFD96B] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_st__enabl__1AD3FDA4] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_survey_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_su__defau__1372D2FE] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_su__level__1466F737] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_su__enabl__155B1B70] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_task_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ta__defau__4A58F394] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ta__level__4B4D17CD] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_ta__enabl__4C413C06] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_task_loe] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ta__defau__45943E77] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ta__level__468862B0] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_ta__enabl__477C86E9] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_task_priority] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ta__defau__40CF895A] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ta__level__41C3AD93] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_ta__enabl__42B7D1CC] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [lookup_ticketsource] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_ti__defau__7F16D496] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_ti__level__000AF8CF] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_ti__enabl__00FF1D08] DEFAULT (1) FOR [enabled],
	 UNIQUE  NONCLUSTERED 
	(
		[description]
	)  ON [PRIMARY] 
GO

ALTER TABLE [notification] WITH NOCHECK ADD 
	CONSTRAINT [DF__notificat__item___55009F39] DEFAULT (getdate()) FOR [item_modified],
	CONSTRAINT [DF__notificat__attem__55F4C372] DEFAULT (getdate()) FOR [attempt]
GO

ALTER TABLE [permission_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__permissio__level__7A672E12] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__permissio__enabl__7B5B524B] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__permissio__activ__7C4F7684] DEFAULT (1) FOR [active],
	CONSTRAINT [DF__permissio__folde__7D439ABD] DEFAULT (0) FOR [folders],
	CONSTRAINT [DF__permissio__looku__7E37BEF6] DEFAULT (0) FOR [lookups],
	CONSTRAINT [DF__permissio__viewp__7F2BE32F] DEFAULT (0) FOR [viewpoints],
	CONSTRAINT [DF__permissio__categ__00200768] DEFAULT (0) FOR [categories],
	CONSTRAINT [DF__permissio__sched__01142BA1] DEFAULT (0) FOR [scheduled_events],
	CONSTRAINT [DF__permissio__objec__02084FDA] DEFAULT (0) FOR [object_events],
	CONSTRAINT [DF__permissio__repor__02FC7413] DEFAULT (0) FOR [reports]
GO

ALTER TABLE [search_fields] WITH NOCHECK ADD 
	CONSTRAINT [DF__search_fi__searc__5ECA0095] DEFAULT (1) FOR [searchable],
	CONSTRAINT [DF__search_fi__field__5FBE24CE] DEFAULT ((-1)) FOR [field_typeid],
	CONSTRAINT [DF__search_fi__enabl__60B24907] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [sync_client] WITH NOCHECK ADD 
	CONSTRAINT [DF__sync_clie__enter__522F1F86] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__sync_clie__modif__532343BF] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__sync_clie__ancho__541767F8] DEFAULT (null) FOR [anchor],
	CONSTRAINT [DF__sync_clie__enabl__550B8C31] DEFAULT (0) FOR [enabled]
GO

ALTER TABLE [sync_system] WITH NOCHECK ADD 
	CONSTRAINT [DF__sync_syst__enabl__57E7F8DC] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [ticket_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_ca__cat_l__0A888742] DEFAULT (0) FOR [cat_level],
	CONSTRAINT [DF__ticket_ca__full___0B7CAB7B] DEFAULT ('') FOR [full_description],
	CONSTRAINT [DF__ticket_ca__defau__0C70CFB4] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__ticket_ca__level__0D64F3ED] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__ticket_ca__enabl__0E591826] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [ticket_category_draft] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_ca__link___113584D1] DEFAULT ((-1)) FOR [link_id],
	CONSTRAINT [DF__ticket_ca__cat_l__1229A90A] DEFAULT (0) FOR [cat_level],
	CONSTRAINT [DF__ticket_ca__full___131DCD43] DEFAULT ('') FOR [full_description],
	CONSTRAINT [DF__ticket_ca__defau__1411F17C] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__ticket_ca__level__150615B5] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__ticket_ca__enabl__15FA39EE] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [ticket_level] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_le__defau__72B0FDB1] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__ticket_le__level__73A521EA] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__ticket_le__enabl__74994623] DEFAULT (1) FOR [enabled],
	 UNIQUE  NONCLUSTERED 
	(
		[description]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_priority] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_pr__style__04CFADEC] DEFAULT ('') FOR [style],
	CONSTRAINT [DF__ticket_pr__defau__05C3D225] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__ticket_pr__level__06B7F65E] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__ticket_pr__enabl__07AC1A97] DEFAULT (1) FOR [enabled],
	 UNIQUE  NONCLUSTERED 
	(
		[description]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ticket_severity] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_se__style__7869D707] DEFAULT ('') FOR [style],
	CONSTRAINT [DF__ticket_se__defau__795DFB40] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__ticket_se__level__7A521F79] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__ticket_se__enabl__7B4643B2] DEFAULT (1) FOR [enabled],
	 UNIQUE  NONCLUSTERED 
	(
		[description]
	)  ON [PRIMARY] 
GO

ALTER TABLE [usage_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__usage_log__enter__0EA330E9] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [access_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__access_lo__enter__0BC6C43E] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [action_list] WITH NOCHECK ADD 
	CONSTRAINT [DF__action_li__enter__2F9A1060] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__action_li__modif__318258D2] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__action_li__enabl__32767D0B] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [autoguide_model] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__enter__7A3D10E0] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__7B313519] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [business_process] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__735B0927] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__business___enter__744F2D60] DEFAULT (getdate()) FOR [entered],
	 UNIQUE  NONCLUSTERED 
	(
		[process_name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [business_process_component_result_lookup] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___level__6AC5C326] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__business___enabl__6BB9E75F] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [business_process_hook_library] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__14BBFCF2] DEFAULT (0) FOR [enabled]
GO

ALTER TABLE [campaign] WITH NOCHECK ADD 
	CONSTRAINT [DF__campaign__messag__63C3BFDC] DEFAULT ((-1)) FOR [message_id],
	CONSTRAINT [DF__campaign__reply___64B7E415] DEFAULT (null) FOR [reply_addr],
	CONSTRAINT [DF__campaign__subjec__65AC084E] DEFAULT (null) FOR [subject],
	CONSTRAINT [DF__campaign__messag__66A02C87] DEFAULT (null) FOR [message],
	CONSTRAINT [DF__campaign__status__679450C0] DEFAULT (0) FOR [status_id],
	CONSTRAINT [DF__campaign__active__688874F9] DEFAULT (0) FOR [active],
	CONSTRAINT [DF__campaign__active__697C9932] DEFAULT (null) FOR [active_date],
	CONSTRAINT [DF__campaign__send_m__6A70BD6B] DEFAULT ((-1)) FOR [send_method_id],
	CONSTRAINT [DF__campaign__inacti__6B64E1A4] DEFAULT (null) FOR [inactive_date],
	CONSTRAINT [DF__campaign__approv__6C5905DD] DEFAULT (null) FOR [approval_date],
	CONSTRAINT [DF__campaign__enable__6E414E4F] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__campaign__entere__6F357288] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__campaign__modifi__711DBAFA] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__campaign__type__7306036C] DEFAULT (1) FOR [type]
GO

ALTER TABLE [category_editor_lookup] WITH NOCHECK ADD 
	CONSTRAINT [DF__category___level__7849DB76] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__category___enter__793DFFAF] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [cfsinbox_message] WITH NOCHECK ADD 
	CONSTRAINT [DF__cfsinbox___subje__58D1301D] DEFAULT (null) FOR [subject],
	CONSTRAINT [DF__cfsinbox_m__sent__5AB9788F] DEFAULT (getdate()) FOR [sent],
	CONSTRAINT [DF__cfsinbox___enter__5BAD9CC8] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__cfsinbox___modif__5CA1C101] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__cfsinbox_m__type__5D95E53A] DEFAULT ((-1)) FOR [type],
	CONSTRAINT [DF__cfsinbox___delet__5F7E2DAC] DEFAULT (0) FOR [delete_flag]
GO

ALTER TABLE [help_tableof_contents] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_tabl__enter__0AA882D3] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_tabl__modif__0C90CB45] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_tabl__enabl__0D84EF7E] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [import] WITH NOCHECK ADD 
	CONSTRAINT [DF__import__entered__44952D46] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__import__modified__467D75B8] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [lookup_contact_types] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_co__defau__117F9D94] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__lookup_co__level__1273C1CD] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_co__enabl__1367E606] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__lookup_co__categ__15502E78] DEFAULT (0) FOR [category]
GO

ALTER TABLE [lookup_lists_lookup] WITH NOCHECK ADD 
	CONSTRAINT [DF__lookup_li__level__73852659] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__lookup_li__enter__74794A92] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [message] WITH NOCHECK ADD 
	CONSTRAINT [DF__message__subject__638EB5B2] DEFAULT (null) FOR [subject],
	CONSTRAINT [DF__message__enabled__6482D9EB] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__message__entered__6576FE24] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__message__modifie__675F4696] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [message_template] WITH NOCHECK ADD 
	CONSTRAINT [DF__message_t__enabl__6C23FBB3] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__message_t__enter__6D181FEC] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__message_t__modif__6F00685E] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [module_field_categorylink] WITH NOCHECK ADD 
	CONSTRAINT [DF__module_fi__level__2A8B4280] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__module_fi__enter__2B7F66B9] DEFAULT (getdate()) FOR [entered],
	 UNIQUE  NONCLUSTERED 
	(
		[category_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [organization] WITH NOCHECK ADD 
	CONSTRAINT [DF__organizat__ticke__52593CB8] DEFAULT (null) FOR [ticker_symbol],
	CONSTRAINT [DF__organizat__sales__534D60F1] DEFAULT (0) FOR [sales_rep],
	CONSTRAINT [DF__organizat__miner__5441852A] DEFAULT (0) FOR [miner_only],
	CONSTRAINT [DF__organizat__enter__5535A963] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__organizat__modif__571DF1D5] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__organizat__enabl__59063A47] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__organizat__dupli__5AEE82B9] DEFAULT ((-1)) FOR [duplicate_id],
	CONSTRAINT [DF__organizat__custo__5BE2A6F2] DEFAULT ((-1)) FOR [custom1],
	CONSTRAINT [DF__organizat__custo__5CD6CB2B] DEFAULT ((-1)) FOR [custom2],
	CONSTRAINT [DF__organizat__contr__5DCAEF64] DEFAULT (null) FOR [contract_end],
	CONSTRAINT [DF__organizat__alert__5EBF139D] DEFAULT (null) FOR [alertdate],
	CONSTRAINT [DF__organizat__alert__5FB337D6] DEFAULT (null) FOR [alert]
GO

ALTER TABLE [permission] WITH NOCHECK ADD 
	CONSTRAINT [DF__permissio__permi__06CD04F7] DEFAULT (0) FOR [permission_view],
	CONSTRAINT [DF__permissio__permi__07C12930] DEFAULT (0) FOR [permission_add],
	CONSTRAINT [DF__permissio__permi__08B54D69] DEFAULT (0) FOR [permission_edit],
	CONSTRAINT [DF__permissio__permi__09A971A2] DEFAULT (0) FOR [permission_delete],
	CONSTRAINT [DF__permissio__descr__0A9D95DB] DEFAULT ('') FOR [description],
	CONSTRAINT [DF__permissio__level__0B91BA14] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__permissio__enabl__0C85DE4D] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__permissio__activ__0D7A0286] DEFAULT (1) FOR [active],
	CONSTRAINT [DF__permissio__viewp__0E6E26BF] DEFAULT (0) FOR [viewpoints]
GO

ALTER TABLE [process_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__process_l__enter__729BEF18] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [project_files] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_fi__size__52AE4273] DEFAULT (0) FOR [size],
	CONSTRAINT [DF__project_f__versi__53A266AC] DEFAULT (0) FOR [version],
	CONSTRAINT [DF__project_f__enabl__54968AE5] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__project_f__downl__558AAF1E] DEFAULT (0) FOR [downloads],
	CONSTRAINT [DF__project_f__enter__567ED357] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_f__modif__58671BC9] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [projects] WITH NOCHECK ADD 
	CONSTRAINT [DF__projects__reques__1881A0DE] DEFAULT (getdate()) FOR [requestDate],
	CONSTRAINT [DF__projects__entere__1975C517] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__projects__modifi__1B5E0D89] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [role] WITH NOCHECK ADD 
	CONSTRAINT [DF__role__descriptio__72C60C4A] DEFAULT ('') FOR [description],
	CONSTRAINT [DF__role__entered__74AE54BC] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__role__modified__76969D2E] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__role__enabled__778AC167] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [saved_criterialist] WITH NOCHECK ADD 
	CONSTRAINT [DF__saved_cri__enter__5B2E79DB] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__saved_cri__modif__5D16C24D] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__saved_cri__conta__5FF32EF8] DEFAULT ((-1)) FOR [contact_source],
	CONSTRAINT [DF__saved_cri__enabl__60E75331] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [survey] WITH NOCHECK ADD 
	CONSTRAINT [DF__survey__itemLeng__1837881B] DEFAULT ((-1)) FOR [itemLength],
	CONSTRAINT [DF__survey__type__192BAC54] DEFAULT ((-1)) FOR [type],
	CONSTRAINT [DF__survey__enabled__1A1FD08D] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__survey__status__1B13F4C6] DEFAULT ((-1)) FOR [status],
	CONSTRAINT [DF__survey__entered__1C0818FF] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__survey__modified__1DF06171] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [sync_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__sync_log__entere__6AFACD50] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [sync_table] WITH NOCHECK ADD 
	CONSTRAINT [DF__sync_tabl__enter__5BB889C0] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__sync_tabl__modif__5CACADF9] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__sync_tabl__order__5DA0D232] DEFAULT ((-1)) FOR [order_id],
	CONSTRAINT [DF__sync_tabl__sync___5E94F66B] DEFAULT (0) FOR [sync_item]
GO

ALTER TABLE [task] WITH NOCHECK ADD 
	CONSTRAINT [DF__task__entered__4F1DA8B1] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__task__complete__51FA155C] DEFAULT (0) FOR [complete],
	CONSTRAINT [DF__task__enabled__52EE3995] DEFAULT (0) FOR [enabled],
	CONSTRAINT [DF__task__modified__53E25DCE] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__task__type__56BECA79] DEFAULT (1) FOR [type]
GO

ALTER TABLE [viewpoint] WITH NOCHECK ADD 
	CONSTRAINT [DF__viewpoint__enter__7E02B4CC] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__viewpoint__modif__7FEAFD3E] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__viewpoint__enabl__01D345B0] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [account_type_levels] WITH NOCHECK ADD 
	CONSTRAINT [DF__account_t__enter__69FBBC1F] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__account_t__modif__6AEFE058] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [action_item] WITH NOCHECK ADD 
	CONSTRAINT [DF__action_it__enter__373B3228] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__action_it__modif__39237A9A] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__action_it__enabl__3A179ED3] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [active_campaign_groups] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_ca__group__0618D7E0] DEFAULT (null) FOR [groupcriteria]
GO

ALTER TABLE [active_survey] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_su__itemL__2F1AED73] DEFAULT ((-1)) FOR [itemLength],
	CONSTRAINT [DF__active_su__enabl__310335E5] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__active_su__enter__31F75A1E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__active_su__modif__33DFA290] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [autoguide_vehicle] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__enter__7FF5EA36] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__00EA0E6F] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [business_process_component] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__7A0806B6] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [business_process_events] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___secon__0579B962] DEFAULT ('0') FOR [second],
	CONSTRAINT [DF__business___minut__066DDD9B] DEFAULT ('*') FOR [minute],
	CONSTRAINT [DF__business_p__hour__076201D4] DEFAULT ('*') FOR [hour],
	CONSTRAINT [DF__business___dayof__0856260D] DEFAULT ('*') FOR [dayofmonth],
	CONSTRAINT [DF__business___month__094A4A46] DEFAULT ('*') FOR [month],
	CONSTRAINT [DF__business___dayof__0A3E6E7F] DEFAULT ('*') FOR [dayofweek],
	CONSTRAINT [DF__business_p__year__0B3292B8] DEFAULT ('*') FOR [year],
	CONSTRAINT [DF__business___busin__0C26B6F1] DEFAULT ('true') FOR [businessDays],
	CONSTRAINT [DF__business___enabl__0D1ADB2A] DEFAULT (0) FOR [enabled],
	CONSTRAINT [DF__business___enter__0E0EFF63] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [business_process_hook_triggers] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__188C8DD6] DEFAULT (0) FOR [enabled]
GO

ALTER TABLE [business_process_parameter] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__7DD8979A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [campaign_run] WITH NOCHECK ADD 
	CONSTRAINT [DF__campaign___statu__76D69450] DEFAULT (0) FOR [status],
	CONSTRAINT [DF__campaign___run_d__77CAB889] DEFAULT (getdate()) FOR [run_date],
	CONSTRAINT [DF__campaign___total__78BEDCC2] DEFAULT (0) FOR [total_contacts],
	CONSTRAINT [DF__campaign___total__79B300FB] DEFAULT (0) FOR [total_sent],
	CONSTRAINT [DF__campaign___total__7AA72534] DEFAULT (0) FOR [total_replied],
	CONSTRAINT [DF__campaign___total__7B9B496D] DEFAULT (0) FOR [total_bounced]
GO

ALTER TABLE [contact] WITH NOCHECK ADD 
	CONSTRAINT [DF__contact__entered__6754599E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__contact__modifie__693CA210] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__contact__enabled__6B24EA82] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__contact__custom1__6D0D32F4] DEFAULT ((-1)) FOR [custom1],
	CONSTRAINT [DF__contact__primary__6E01572D] DEFAULT (0) FOR [primary_contact],
	CONSTRAINT [DF__contact__employe__6EF57B66] DEFAULT (0) FOR [employee]
GO

ALTER TABLE [custom_field_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__custom_fi__level__2F4FF79D] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__custom_fi__start__30441BD6] DEFAULT (getdate()) FOR [start_date],
	CONSTRAINT [DF__custom_fi__defau__3138400F] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__custom_fi__enter__322C6448] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__custom_fi__enabl__33208881] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__custom_fi__multi__3414ACBA] DEFAULT (0) FOR [multiple_records],
	CONSTRAINT [DF__custom_fi__read___3508D0F3] DEFAULT (0) FOR [read_only]
GO

ALTER TABLE [help_contents] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_cont__enter__002AF460] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_cont__modif__02133CD2] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_cont__enabl__0307610B] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [help_faqs] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_faqs__enter__32B6742D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_faqs__modif__349EBC9F] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_faqs__enabl__36870511] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [news] WITH NOCHECK ADD 
	CONSTRAINT [DF__news__created__236943A5] DEFAULT (getdate()) FOR [created]
GO

ALTER TABLE [organization_address] WITH NOCHECK ADD 
	CONSTRAINT [DF__organizat__enter__282DF8C2] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__organizat__modif__2A164134] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [organization_emailaddress] WITH NOCHECK ADD 
	CONSTRAINT [DF__organizat__enter__2FCF1A8A] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__organizat__modif__31B762FC] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [organization_phone] WITH NOCHECK ADD 
	CONSTRAINT [DF__organizat__enter__37703C52] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__organizat__modif__395884C4] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [product_catalog] WITH NOCHECK ADD 
	CONSTRAINT [DF__product_c__in_st__2B5F6B28] DEFAULT (1) FOR [in_stock],
	CONSTRAINT [DF__product_c__list___320C68B7] DEFAULT (10) FOR [list_order],
	CONSTRAINT [DF__product_c__enter__33F4B129] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__product_c__modif__35DCF99B] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__product_c__start__36D11DD4] DEFAULT (null) FOR [start_date],
	CONSTRAINT [DF__product_c__expir__37C5420D] DEFAULT (null) FOR [expiration_date],
	CONSTRAINT [DF__product_c__enabl__38B96646] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [product_category] WITH NOCHECK ADD 
	CONSTRAINT [DF__product_c__list___7F80E8EA] DEFAULT (10) FOR [list_order],
	CONSTRAINT [DF__product_c__enter__0169315C] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__product_c__modif__035179CE] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__product_c__start__04459E07] DEFAULT (null) FOR [start_date],
	CONSTRAINT [DF__product_c__expir__0539C240] DEFAULT (null) FOR [expiration_date],
	CONSTRAINT [DF__product_c__enabl__062DE679] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [product_option] WITH NOCHECK ADD 
	CONSTRAINT [DF__product_o__allow__73DA2C14] DEFAULT (0) FOR [allow_customer_configure],
	CONSTRAINT [DF__product_o__allow__74CE504D] DEFAULT (0) FOR [allow_user_configure],
	CONSTRAINT [DF__product_o__requi__75C27486] DEFAULT (0) FOR [required],
	CONSTRAINT [DF__product_o__start__76B698BF] DEFAULT (null) FOR [start_date],
	CONSTRAINT [DF__product_o__end_d__77AABCF8] DEFAULT (null) FOR [end_date],
	CONSTRAINT [DF__product_o__enabl__789EE131] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [project_files_download] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_f__versi__65C116E7] DEFAULT (0) FOR [version],
	CONSTRAINT [DF__project_f__downl__67A95F59] DEFAULT (getdate()) FOR [download_date]
GO

ALTER TABLE [project_files_version] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_fi__size__5C37ACAD] DEFAULT (0) FOR [size],
	CONSTRAINT [DF__project_f__versi__5D2BD0E6] DEFAULT (0) FOR [version],
	CONSTRAINT [DF__project_f__enabl__5E1FF51F] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__project_f__downl__5F141958] DEFAULT (0) FOR [downloads],
	CONSTRAINT [DF__project_f__enter__60083D91] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_f__modif__61F08603] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [project_issues] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_i__impor__408F9238] DEFAULT (0) FOR [importance],
	CONSTRAINT [DF__project_i__enabl__4183B671] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__project_i__enter__4277DAAA] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_i__modif__4460231C] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [project_requirements] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_r__enter__23F3538A] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_r__modif__25DB9BFC] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [project_team] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_t__enter__6B79F03D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_t__modif__6D6238AF] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [report] WITH NOCHECK ADD 
	CONSTRAINT [DF__report__type__0E391C95] DEFAULT (1) FOR [type],
	CONSTRAINT [DF__report__entered__0F2D40CE] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__report__modified__11158940] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__report__enabled__12FDD1B2] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__report__custom__13F1F5EB] DEFAULT (0) FOR [custom]
GO

ALTER TABLE [revenue] WITH NOCHECK ADD 
	CONSTRAINT [DF__revenue__transac__2BD46C74] DEFAULT ((-1)) FOR [transaction_id],
	CONSTRAINT [DF__revenue__month__2CC890AD] DEFAULT ((-1)) FOR [month],
	CONSTRAINT [DF__revenue__year__2DBCB4E6] DEFAULT ((-1)) FOR [year],
	CONSTRAINT [DF__revenue__amount__2EB0D91F] DEFAULT (0) FOR [amount],
	CONSTRAINT [DF__revenue__entered__318D45CA] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__revenue__modifie__33758E3C] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [role_permission] WITH NOCHECK ADD 
	CONSTRAINT [DF__role_perm__role___1332DBDC] DEFAULT (0) FOR [role_view],
	CONSTRAINT [DF__role_perm__role___14270015] DEFAULT (0) FOR [role_add],
	CONSTRAINT [DF__role_perm__role___151B244E] DEFAULT (0) FOR [role_edit],
	CONSTRAINT [DF__role_perm__role___160F4887] DEFAULT (0) FOR [role_delete]
GO

ALTER TABLE [saved_criteriaelement] WITH NOCHECK ADD 
	CONSTRAINT [DF__saved_cri__sourc__74B941B4] DEFAULT ((-1)) FOR [source]
GO

ALTER TABLE [survey_questions] WITH NOCHECK ADD 
	CONSTRAINT [DF__survey_qu__requi__2685A772] DEFAULT (0) FOR [required],
	CONSTRAINT [DF__survey_qu__posit__2779CBAB] DEFAULT (0) FOR [position]
GO

ALTER TABLE [sync_conflict_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__sync_conf__statu__66361833] DEFAULT (getdate()) FOR [status_date]
GO

ALTER TABLE [sync_map] WITH NOCHECK ADD 
	CONSTRAINT [DF__sync_map__comple__6265874F] DEFAULT (0) FOR [complete]
GO

ALTER TABLE [viewpoint_permission] WITH NOCHECK ADD 
	CONSTRAINT [DF__viewpoint__viewp__0697FACD] DEFAULT (0) FOR [viewpoint_view],
	CONSTRAINT [DF__viewpoint__viewp__078C1F06] DEFAULT (0) FOR [viewpoint_add],
	CONSTRAINT [DF__viewpoint__viewp__0880433F] DEFAULT (0) FOR [viewpoint_edit],
	CONSTRAINT [DF__viewpoint__viewp__09746778] DEFAULT (0) FOR [viewpoint_delete]
GO

ALTER TABLE [action_item_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__action_it__link___3DE82FB7] DEFAULT ((-1)) FOR [link_item_id],
	CONSTRAINT [DF__action_it__enter__3FD07829] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__action_it__modif__41B8C09B] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [active_survey_questions] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_su__requi__39987BE6] DEFAULT (0) FOR [required],
	CONSTRAINT [DF__active_su__posit__3A8CA01F] DEFAULT (0) FOR [position],
	CONSTRAINT [DF__active_su__avera__3B80C458] DEFAULT (0.00) FOR [average],
	CONSTRAINT [DF__active_su__total__3C74E891] DEFAULT (0) FOR [total1],
	CONSTRAINT [DF__active_su__total__3D690CCA] DEFAULT (0) FOR [total2],
	CONSTRAINT [DF__active_su__total__3E5D3103] DEFAULT (0) FOR [total3],
	CONSTRAINT [DF__active_su__total__3F51553C] DEFAULT (0) FOR [total4],
	CONSTRAINT [DF__active_su__total__40457975] DEFAULT (0) FOR [total5],
	CONSTRAINT [DF__active_su__total__41399DAE] DEFAULT (0) FOR [total6],
	CONSTRAINT [DF__active_su__total__422DC1E7] DEFAULT (0) FOR [total7]
GO

ALTER TABLE [active_survey_responses] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_su__conta__49CEE3AF] DEFAULT ((-1)) FOR [contact_id],
	CONSTRAINT [DF__active_su__enter__4AC307E8] DEFAULT (getdate()) FOR [entered]
GO

ALTER TABLE [autoguide_inventory] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__is_ne__05AEC38C] DEFAULT (0) FOR [is_new],
	CONSTRAINT [DF__autoguide___sold__06A2E7C5] DEFAULT (0) FOR [sold],
	CONSTRAINT [DF__autoguide__enter__07970BFE] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__088B3037] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [business_process_component_parameter] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__029D4CB7] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [business_process_hook] WITH NOCHECK ADD 
	CONSTRAINT [DF__business___enabl__1D5142F3] DEFAULT (0) FOR [enabled]
GO

ALTER TABLE [cfsinbox_messagelink] WITH NOCHECK ADD 
	CONSTRAINT [DF__cfsinbox___statu__634EBE90] DEFAULT (0) FOR [status],
	CONSTRAINT [DF__cfsinbox___viewe__6442E2C9] DEFAULT (null) FOR [viewed],
	CONSTRAINT [DF__cfsinbox___enabl__65370702] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [contact_address] WITH NOCHECK ADD 
	CONSTRAINT [DF__contact_a__enter__3F115E1A] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__contact_a__modif__40F9A68C] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [contact_emailaddress] WITH NOCHECK ADD 
	CONSTRAINT [DF__contact_e__enter__46B27FE2] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__contact_e__modif__489AC854] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__contact_e__prima__4A8310C6] DEFAULT (0) FOR [primary_email]
GO

ALTER TABLE [contact_phone] WITH NOCHECK ADD 
	CONSTRAINT [DF__contact_p__enter__4F47C5E3] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__contact_p__modif__51300E55] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [contact_type_levels] WITH NOCHECK ADD 
	CONSTRAINT [DF__contact_t__enter__6EC0713C] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__contact_t__modif__6FB49575] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [custom_field_group] WITH NOCHECK ADD 
	CONSTRAINT [DF__custom_fi__level__38D961D7] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__custom_fi__start__39CD8610] DEFAULT (getdate()) FOR [start_date],
	CONSTRAINT [DF__custom_fi__enter__3AC1AA49] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__custom_fi__enabl__3BB5CE82] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [custom_field_record] WITH NOCHECK ADD 
	CONSTRAINT [DF__custom_fi__enter__50B0EB68] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__custom_fi__modif__529933DA] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__custom_fi__enabl__54817C4C] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [help_business_rules] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_busi__enter__3B4BBA2E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_busi__modif__3D3402A0] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_busi__enabl__3F1C4B12] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [help_features] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_feat__enter__2097C3F2] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_feat__modif__22800C64] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_feat__enabl__246854D6] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__help_feat__level__255C790F] DEFAULT (0) FOR [level]
GO

ALTER TABLE [help_notes] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_note__enter__43E1002F] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_note__modif__45C948A1] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_note__enabl__47B19113] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [help_related_links] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_rela__enter__2B155265] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_rela__modif__2CFD9AD7] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_rela__enabl__2DF1BF10] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [help_tableofcontentitem_links] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_tabl__enter__133DC8D4] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_tabl__modif__15261146] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_tabl__enabl__161A357F] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [help_tips] WITH NOCHECK ADD 
	CONSTRAINT [DF__help_tips__enter__4C764630] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__help_tips__modif__4E5E8EA2] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__help_tips__enabl__4F52B2DB] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [opportunity_header] WITH NOCHECK ADD 
	CONSTRAINT [DF__opportuni__enter__589C25F3] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__opportuni__modif__5A846E65] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [package] WITH NOCHECK ADD 
	CONSTRAINT [DF__package__list_or__4F9CCB9E] DEFAULT (10) FOR [list_order],
	CONSTRAINT [DF__package__entered__51851410] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__package__modifie__536D5C82] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__package__start_d__546180BB] DEFAULT (null) FOR [start_date],
	CONSTRAINT [DF__package__expirat__5555A4F4] DEFAULT (null) FOR [expiration_date],
	CONSTRAINT [DF__package__enabled__5649C92D] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [product_catalog_pricing] WITH NOCHECK ADD 
	CONSTRAINT [DF__product_c__msrp___3E723F9C] DEFAULT (0) FOR [msrp_amount],
	CONSTRAINT [DF__product_c__price__405A880E] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__product_c__recur__4242D080] DEFAULT (0) FOR [recurring_amount],
	CONSTRAINT [DF__product_c__enter__451F3D2B] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__product_c__modif__4707859D] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__product_c__start__47FBA9D6] DEFAULT (null) FOR [start_date],
	CONSTRAINT [DF__product_c__expir__48EFCE0F] DEFAULT (null) FOR [expiration_date]
GO

ALTER TABLE [product_option_values] WITH NOCHECK ADD 
	CONSTRAINT [DF__product_o__msrp___7D63964E] DEFAULT (0) FOR [msrp_amount],
	CONSTRAINT [DF__product_o__price__7F4BDEC0] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__product_o__recur__01342732] DEFAULT (0) FOR [recurring_amount]
GO

ALTER TABLE [project_assignments] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_a__assig__314D4EA8] DEFAULT (getdate()) FOR [assign_date],
	CONSTRAINT [DF__project_a__statu__3335971A] DEFAULT (getdate()) FOR [status_date],
	CONSTRAINT [DF__project_a__enter__3429BB53] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_a__modif__361203C5] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [project_issue_replies] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_i__reply__4924D839] DEFAULT (0) FOR [reply_to],
	CONSTRAINT [DF__project_i__enter__4A18FC72] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__project_i__modif__4C0144E4] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [report_criteria] WITH NOCHECK ADD 
	CONSTRAINT [DF__report_cr__enter__18B6AB08] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__report_cr__modif__1A9EF37A] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__report_cr__enabl__1C873BEC] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [report_queue] WITH NOCHECK ADD 
	CONSTRAINT [DF__report_qu__enter__2334397B] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__report_qu__proce__251C81ED] DEFAULT (null) FOR [processed],
	CONSTRAINT [DF__report_qu__statu__2610A626] DEFAULT (0) FOR [status],
	CONSTRAINT [DF__report_qu__files__2704CA5F] DEFAULT ((-1)) FOR [filesize],
	CONSTRAINT [DF__report_qu__enabl__27F8EE98] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [revenue_detail] WITH NOCHECK ADD 
	CONSTRAINT [DF__revenue_d__amoun__383A4359] DEFAULT (0) FOR [amount],
	CONSTRAINT [DF__revenue_d__enter__3B16B004] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__revenue_d__modif__3CFEF876] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [scheduled_recipient] WITH NOCHECK ADD 
	CONSTRAINT [DF__scheduled__run_i__0ADD8CFD] DEFAULT ((-1)) FOR [run_id],
	CONSTRAINT [DF__scheduled__statu__0BD1B136] DEFAULT (0) FOR [status_id],
	CONSTRAINT [DF__scheduled__statu__0CC5D56F] DEFAULT (getdate()) FOR [status_date],
	CONSTRAINT [DF__scheduled__sched__0DB9F9A8] DEFAULT (getdate()) FOR [scheduled_date],
	CONSTRAINT [DF__scheduled__sent___0EAE1DE1] DEFAULT (null) FOR [sent_date],
	CONSTRAINT [DF__scheduled__reply__0FA2421A] DEFAULT (null) FOR [reply_date],
	CONSTRAINT [DF__scheduled__bounc__10966653] DEFAULT (null) FOR [bounce_date]
GO

ALTER TABLE [service_contract] WITH NOCHECK ADD 
	CONSTRAINT [DF__service_c__enter__4119A21D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__service_c__modif__4301EA8F] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__service_c__enabl__44EA3301] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [survey_items] WITH NOCHECK ADD 
	CONSTRAINT [DF__survey_ite__type__2B4A5C8F] DEFAULT ((-1)) FOR [type]
GO

ALTER TABLE [active_survey_answers] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_su__quant__4F87BD05] DEFAULT ((-1)) FOR [quant_ans]
GO

ALTER TABLE [active_survey_items] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_sur__type__45FE52CB] DEFAULT ((-1)) FOR [type]
GO

ALTER TABLE [asset] WITH NOCHECK ADD 
	CONSTRAINT [DF__asset__entered__6B0FDBE9] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__asset__modified__6CF8245B] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__asset__enabled__6EE06CCD] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [autoguide_ad_run] WITH NOCHECK ADD 
	CONSTRAINT [DF__autoguide__inclu__14F1071C] DEFAULT (0) FOR [include_photo],
	CONSTRAINT [DF__autoguide__compl__15E52B55] DEFAULT ((-1)) FOR [completedby],
	CONSTRAINT [DF__autoguide__enter__16D94F8E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__autoguide__modif__17CD73C7] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [call_log] WITH NOCHECK ADD 
	CONSTRAINT [DF__call_log__entere__725BF7F6] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__call_log__modifi__74444068] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__call_log__alert__762C88DA] DEFAULT (null) FOR [alert]
GO

ALTER TABLE [custom_field_info] WITH NOCHECK ADD 
	CONSTRAINT [DF__custom_fi__level__3F865F66] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__custom_fi__valid__407A839F] DEFAULT (0) FOR [validation_type],
	CONSTRAINT [DF__custom_fi__requi__416EA7D8] DEFAULT (0) FOR [required],
	CONSTRAINT [DF__custom_fi__start__4262CC11] DEFAULT (getdate()) FOR [start_date],
	CONSTRAINT [DF__custom_fi__end_d__4356F04A] DEFAULT (null) FOR [end_date],
	CONSTRAINT [DF__custom_fi__enter__444B1483] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__custom_fi__enabl__453F38BC] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [opportunity_component] WITH NOCHECK ADD 
	CONSTRAINT [DF__opportuni__stage__61316BF4] DEFAULT (getdate()) FOR [stagedate],
	CONSTRAINT [DF__opportuni__enter__6225902D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__opportuni__modif__640DD89F] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__opportuni__alert__65F62111] DEFAULT (null) FOR [alert],
	CONSTRAINT [DF__opportuni__enabl__66EA454A] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [package_products_map] WITH NOCHECK ADD 
	CONSTRAINT [DF__package_p__msrp___5C02A283] DEFAULT (0) FOR [msrp_amount],
	CONSTRAINT [DF__package_p__price__5DEAEAF5] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__package_p__enter__5FD33367] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__package_p__modif__61BB7BD9] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__package_p__start__62AFA012] DEFAULT (null) FOR [start_date],
	CONSTRAINT [DF__package_p__expir__63A3C44B] DEFAULT (null) FOR [expiration_date]
GO

ALTER TABLE [project_assignments_status] WITH NOCHECK ADD 
	CONSTRAINT [DF__project_a__statu__3BCADD1B] DEFAULT (getdate()) FOR [status_date]
GO

ALTER TABLE [service_contract_hours] WITH NOCHECK ADD 
	CONSTRAINT [DF__service_c__enter__49AEE81E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__service_c__modif__4B973090] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [active_survey_answer_avg] WITH NOCHECK ADD 
	CONSTRAINT [DF__active_su__total__581D0306] DEFAULT (0) FOR [total]
GO

ALTER TABLE [custom_field_data] WITH NOCHECK ADD 
	CONSTRAINT [DF__custom_fi__selec__58520D30] DEFAULT (0) FOR [selected_item_id]
GO

ALTER TABLE [custom_field_lookup] WITH NOCHECK ADD 
	CONSTRAINT [DF__custom_fi__defau__490FC9A0] DEFAULT (0) FOR [default_item],
	CONSTRAINT [DF__custom_fi__level__4A03EDD9] DEFAULT (0) FOR [level],
	CONSTRAINT [DF__custom_fi__start__4AF81212] DEFAULT (getdate()) FOR [start_date],
	CONSTRAINT [DF__custom_fi__enter__4BEC364B] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__custom_fi__enabl__4CE05A84] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [opportunity_component_levels] WITH NOCHECK ADD 
	CONSTRAINT [DF__opportuni__enter__6ABAD62E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__opportuni__modif__6BAEFA67] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [customer_product] WITH NOCHECK ADD 
	CONSTRAINT [DF__customer___statu__186C9245] DEFAULT (getdate()) FOR [status_date],
	CONSTRAINT [DF__customer___enter__1960B67E] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__customer___modif__1B48FEF0] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__customer___enabl__1D314762] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [customer_product_history] WITH NOCHECK ADD 
	CONSTRAINT [DF__customer___enter__22EA20B8] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__customer___modif__24D2692A] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [order_address] WITH NOCHECK ADD 
	CONSTRAINT [DF__order_add__enter__6F6A7CB2] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__order_add__modif__7152C524] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [order_entry] WITH NOCHECK ADD 
	CONSTRAINT [DF__order_ent__statu__30792600] DEFAULT (getdate()) FOR [status_date],
	CONSTRAINT [DF__order_ent__contr__316D4A39] DEFAULT (null) FOR [contract_date],
	CONSTRAINT [DF__order_ent__expir__32616E72] DEFAULT (null) FOR [expiration_date],
	CONSTRAINT [DF__order_ent__enter__353DDB1D] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__order_ent__modif__3726238F] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [order_payment] WITH NOCHECK ADD 
	CONSTRAINT [DF__order_pay__enter__009508B4] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__order_pay__modif__027D5126] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [order_product] WITH NOCHECK ADD 
	CONSTRAINT [DF__order_pro__quant__3CDEFCE5] DEFAULT (0) FOR [quantity],
	CONSTRAINT [DF__order_pro__msrp___3EC74557] DEFAULT (0) FOR [msrp_amount],
	CONSTRAINT [DF__order_pro__price__40AF8DC9] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__order_pro__recur__4297D63B] DEFAULT (0) FOR [recurring_amount],
	CONSTRAINT [DF__order_pro__exten__44801EAD] DEFAULT (0) FOR [extended_price],
	CONSTRAINT [DF__order_pro__total__457442E6] DEFAULT (0) FOR [total_price],
	CONSTRAINT [DF__order_pro__statu__475C8B58] DEFAULT (getdate()) FOR [status_date]
GO

ALTER TABLE [order_product_options] WITH NOCHECK ADD 
	CONSTRAINT [DF__order_pro__quant__54B68676] DEFAULT (0) FOR [quantity],
	CONSTRAINT [DF__order_pro__price__569ECEE8] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__order_pro__recur__5887175A] DEFAULT (0) FOR [recurring_amount],
	CONSTRAINT [DF__order_pro__exten__5A6F5FCC] DEFAULT (0) FOR [extended_price],
	CONSTRAINT [DF__order_pro__total__5B638405] DEFAULT (0) FOR [total_price]
GO

ALTER TABLE [order_product_status] WITH NOCHECK ADD 
	CONSTRAINT [DF__order_pro__enter__4D1564AE] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__order_pro__modif__4EFDAD20] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [payment_creditcard] WITH NOCHECK ADD 
	CONSTRAINT [DF__payment_c__enter__08362A7C] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__payment_c__modif__0A1E72EE] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [payment_eft] WITH NOCHECK ADD 
	CONSTRAINT [DF__payment_e__enter__0EE3280B] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__payment_e__modif__10CB707D] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [quote_entry] WITH NOCHECK ADD 
	CONSTRAINT [DF__quote_ent__statu__670A40DB] DEFAULT (getdate()) FOR [status_date],
	CONSTRAINT [DF__quote_ent__expir__67FE6514] DEFAULT (null) FOR [expiration_date],
	CONSTRAINT [DF__quote_ent__issue__6ADAD1BF] DEFAULT (getdate()) FOR [issued],
	CONSTRAINT [DF__quote_ent__enter__6CC31A31] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__quote_ent__modif__6EAB62A3] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [quote_notes] WITH NOCHECK ADD 
	CONSTRAINT [DF__quote_not__enter__24F264BB] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__quote_not__modif__26DAAD2D] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [quote_product] WITH NOCHECK ADD 
	CONSTRAINT [DF__quote_pro__quant__74643BF9] DEFAULT (0) FOR [quantity],
	CONSTRAINT [DF__quote_pro__price__764C846B] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__quote_pro__recur__7834CCDD] DEFAULT (0) FOR [recurring_amount],
	CONSTRAINT [DF__quote_pro__exten__7A1D154F] DEFAULT (0) FOR [extended_price],
	CONSTRAINT [DF__quote_pro__total__7B113988] DEFAULT (0) FOR [total_price],
	CONSTRAINT [DF__quote_pro__statu__7CF981FA] DEFAULT (getdate()) FOR [status_date]
GO

ALTER TABLE [quote_product_options] WITH NOCHECK ADD 
	CONSTRAINT [DF__quote_pro__quant__01BE3717] DEFAULT (0) FOR [quantity],
	CONSTRAINT [DF__quote_pro__price__03A67F89] DEFAULT (0) FOR [price_amount],
	CONSTRAINT [DF__quote_pro__recur__058EC7FB] DEFAULT (0) FOR [recurring_amount],
	CONSTRAINT [DF__quote_pro__exten__0777106D] DEFAULT (0) FOR [extended_price],
	CONSTRAINT [DF__quote_pro__total__086B34A6] DEFAULT (0) FOR [total_price]
GO

ALTER TABLE [ticket] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket__entered__1ABEEF0B] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__ticket__modified__1CA7377D] DEFAULT (getdate()) FOR [modified]
GO

ALTER TABLE [ticket_csstm_form] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_cs__follo__384F51F2] DEFAULT (0) FOR [follow_up_required],
	CONSTRAINT [DF__ticket_cs__enter__3943762B] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__ticket_cs__modif__3B2BBE9D] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__ticket_cs__enabl__3D14070F] DEFAULT (1) FOR [enabled],
	CONSTRAINT [DF__ticket_cs__trave__3E082B48] DEFAULT (1) FOR [travel_towards_sc],
	CONSTRAINT [DF__ticket_cs__labor__3EFC4F81] DEFAULT (1) FOR [labor_towards_sc]
GO

ALTER TABLE [ticket_sun_form] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticket_su__enter__45A94D10] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__ticket_su__modif__47919582] DEFAULT (getdate()) FOR [modified],
	CONSTRAINT [DF__ticket_su__enabl__4979DDF4] DEFAULT (1) FOR [enabled]
GO

ALTER TABLE [ticketlog] WITH NOCHECK ADD 
	CONSTRAINT [DF__ticketlog__enter__31A25463] DEFAULT (getdate()) FOR [entered],
	CONSTRAINT [DF__ticketlog__modif__338A9CD5] DEFAULT (getdate()) FOR [modified]
GO

 CREATE  INDEX [import_entered_idx] ON [import]([entered]) ON [PRIMARY]
GO

 CREATE  INDEX [import_name_idx] ON [import]([name]) ON [PRIMARY]
GO

 CREATE  INDEX [orglist_name] ON [organization]([name]) ON [PRIMARY]
GO

 CREATE  INDEX [project_files_cidx] ON [project_files]([link_module_id], [link_item_id]) ON [PRIMARY]
GO

 CREATE  INDEX [projects_idx] ON [projects]([group_id], [project_id]) ON [PRIMARY]
GO

 CREATE  INDEX [contact_user_id_idx] ON [contact]([user_id]) ON [PRIMARY]
GO

 CREATE  INDEX [contactlist_namecompany] ON [contact]([namelast], [namefirst], [company]) ON [PRIMARY]
GO

 CREATE  INDEX [contactlist_company] ON [contact]([company], [namelast], [namefirst]) ON [PRIMARY]
GO

 CREATE  INDEX [contact_import_id_idx] ON [contact]([import_id]) ON [PRIMARY]
GO

 CREATE  INDEX [custom_field_cat_idx] ON [custom_field_category]([module_id]) ON [PRIMARY]
GO

 CREATE  INDEX [project_issues_limit_idx] ON [project_issues]([type_id], [project_id], [enteredBy]) ON [PRIMARY]
GO

 CREATE  INDEX [project_issues_idx] ON [project_issues]([issue_id]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [idx_sync_map] ON [sync_map]([client_id], [table_id], [record_id]) ON [PRIMARY]
GO

 CREATE  INDEX [custom_field_grp_idx] ON [custom_field_group]([category_id]) ON [PRIMARY]
GO

 CREATE  INDEX [custom_field_rec_idx] ON [custom_field_record]([link_module_id], [link_item_id], [category_id]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [idx_pr_key_map] ON [product_keyword_map]([product_id], [keyword_id]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [idx_pr_opt_val] ON [product_option_values]([option_id], [result_id]) ON [PRIMARY]
GO

 CREATE  INDEX [project_assignments_idx] ON [project_assignments]([activity_id]) ON [PRIMARY]
GO

 CREATE  INDEX [project_assignments_cidx] ON [project_assignments]([complete_date], [user_assign_id]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [idx_autog_inv_opt] ON [autoguide_inventory_options]([inventory_id], [option_id]) ON [PRIMARY]
GO

 CREATE  INDEX [call_log_cidx] ON [call_log]([alertdate], [enteredby]) ON [PRIMARY]
GO

 CREATE  INDEX [custom_field_inf_idx] ON [custom_field_info]([group_id]) ON [PRIMARY]
GO

 CREATE  INDEX [oppcomplist_closedate] ON [opportunity_component]([closedate]) ON [PRIMARY]
GO

 CREATE  INDEX [oppcomplist_description] ON [opportunity_component]([description]) ON [PRIMARY]
GO

 CREATE  INDEX [custom_field_dat_idx] ON [custom_field_data]([record_id], [field_id]) ON [PRIMARY]
GO

 CREATE  INDEX [ticket_cidx] ON [ticket]([assigned_to], [closed]) ON [PRIMARY]
GO

 CREATE  INDEX [ticketlist_entered] ON [ticket]([entered]) ON [PRIMARY]
GO

ALTER TABLE [access_log] ADD 
	 FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [action_list] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [autoguide_model] ADD 
	 FOREIGN KEY 
	(
		[make_id]
	) REFERENCES [autoguide_make] (
		[make_id]
	)
GO

ALTER TABLE [business_process] ADD 
	 FOREIGN KEY 
	(
		[link_module_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [business_process_component_result_lookup] ADD 
	 FOREIGN KEY 
	(
		[component_id]
	) REFERENCES [business_process_component_library] (
		[component_id]
	)
GO

ALTER TABLE [business_process_hook_library] ADD 
	 FOREIGN KEY 
	(
		[link_module_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [campaign] ADD 
	 FOREIGN KEY 
	(
		[approvedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [category_editor_lookup] ADD 
	 FOREIGN KEY 
	(
		[module_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [cfsinbox_message] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [help_module] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [help_tableof_contents] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [permission_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[firstchild]
	) REFERENCES [help_tableof_contents] (
		[content_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[nextsibling]
	) REFERENCES [help_tableof_contents] (
		[content_id]
	),
	 FOREIGN KEY 
	(
		[parent]
	) REFERENCES [help_tableof_contents] (
		[content_id]
	)
GO

ALTER TABLE [import] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [lookup_contact_types] ADD 
	 FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [lookup_lists_lookup] ADD 
	 FOREIGN KEY 
	(
		[module_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [message] ADD 
	 FOREIGN KEY 
	(
		[access_type]
	) REFERENCES [lookup_access_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [message_template] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [module_field_categorylink] ADD 
	 FOREIGN KEY 
	(
		[module_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [organization] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [permission] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [permission_category] (
		[category_id]
	)
GO

ALTER TABLE [process_log] ADD 
	 FOREIGN KEY 
	(
		[client_id]
	) REFERENCES [sync_client] (
		[client_id]
	),
	 FOREIGN KEY 
	(
		[system_id]
	) REFERENCES [sync_system] (
		[system_id]
	)
GO

ALTER TABLE [product_option_configurator] ADD 
	 FOREIGN KEY 
	(
		[result_type]
	) REFERENCES [lookup_product_conf_result] (
		[code]
	)
GO

ALTER TABLE [project_files] ADD 
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[folder_id]
	) REFERENCES [project_folders] (
		[folder_id]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [projects] ADD 
	 FOREIGN KEY 
	(
		[department_id]
	) REFERENCES [lookup_department] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [role] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [saved_criterialist] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [survey] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [sync_log] ADD 
	 FOREIGN KEY 
	(
		[client_id]
	) REFERENCES [sync_client] (
		[client_id]
	),
	 FOREIGN KEY 
	(
		[system_id]
	) REFERENCES [sync_system] (
		[system_id]
	)
GO

ALTER TABLE [sync_table] ADD 
	 FOREIGN KEY 
	(
		[system_id]
	) REFERENCES [sync_system] (
		[system_id]
	)
GO

ALTER TABLE [task] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [lookup_task_category] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[estimatedloetype]
	) REFERENCES [lookup_task_loe] (
		[code]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[priority]
	) REFERENCES [lookup_task_priority] (
		[code]
	)
GO

ALTER TABLE [viewpoint] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[vp_user_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [account_type_levels] ADD 
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[type_id]
	) REFERENCES [lookup_account_types] (
		[code]
	)
GO

ALTER TABLE [action_item] ADD 
	 FOREIGN KEY 
	(
		[action_id]
	) REFERENCES [action_list] (
		[action_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [active_campaign_groups] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	)
GO

ALTER TABLE [active_survey] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[type]
	) REFERENCES [lookup_survey_types] (
		[code]
	)
GO

ALTER TABLE [autoguide_vehicle] ADD 
	 FOREIGN KEY 
	(
		[make_id]
	) REFERENCES [autoguide_make] (
		[make_id]
	),
	 FOREIGN KEY 
	(
		[model_id]
	) REFERENCES [autoguide_model] (
		[model_id]
	)
GO

ALTER TABLE [business_process_component] ADD 
	 FOREIGN KEY 
	(
		[component_id]
	) REFERENCES [business_process_component_library] (
		[component_id]
	),
	 FOREIGN KEY 
	(
		[parent_id]
	) REFERENCES [business_process_component] (
		[id]
	),
	 FOREIGN KEY 
	(
		[process_id]
	) REFERENCES [business_process] (
		[process_id]
	)
GO

ALTER TABLE [business_process_events] ADD 
	 FOREIGN KEY 
	(
		[process_id]
	) REFERENCES [business_process] (
		[process_id]
	)
GO

ALTER TABLE [business_process_hook_triggers] ADD 
	 FOREIGN KEY 
	(
		[hook_id]
	) REFERENCES [business_process_hook_library] (
		[hook_id]
	)
GO

ALTER TABLE [business_process_parameter] ADD 
	 FOREIGN KEY 
	(
		[process_id]
	) REFERENCES [business_process] (
		[process_id]
	)
GO

ALTER TABLE [campaign_list_groups] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	),
	 FOREIGN KEY 
	(
		[group_id]
	) REFERENCES [saved_criterialist] (
		[id]
	)
GO

ALTER TABLE [campaign_run] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	)
GO

ALTER TABLE [campaign_survey_link] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	),
	 FOREIGN KEY 
	(
		[survey_id]
	) REFERENCES [survey] (
		[survey_id]
	)
GO

ALTER TABLE [contact] ADD 
	 FOREIGN KEY 
	(
		[access_type]
	) REFERENCES [lookup_access_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[assistant]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[department]
	) REFERENCES [lookup_department] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[super]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [custom_field_category] ADD 
	 FOREIGN KEY 
	(
		[module_id]
	) REFERENCES [module_field_categorylink] (
		[category_id]
	)
GO

ALTER TABLE [help_contents] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [permission_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_module_id]
	) REFERENCES [help_module] (
		[module_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[nextcontent]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[prevcontent]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[upcontent]
	) REFERENCES [help_contents] (
		[help_id]
	)
GO

ALTER TABLE [help_faqs] ADD 
	 FOREIGN KEY 
	(
		[completedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owning_module_id]
	) REFERENCES [help_module] (
		[module_id]
	)
GO

ALTER TABLE [news] ADD 
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	)
GO

ALTER TABLE [organization_address] ADD 
	 FOREIGN KEY 
	(
		[address_type]
	) REFERENCES [lookup_orgaddress_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	)
GO

ALTER TABLE [organization_emailaddress] ADD 
	 FOREIGN KEY 
	(
		[emailaddress_type]
	) REFERENCES [lookup_orgemail_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	)
GO

ALTER TABLE [organization_phone] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[phone_type]
	) REFERENCES [lookup_orgphone_types] (
		[code]
	)
GO

ALTER TABLE [product_catalog] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[estimated_ship_time]
	) REFERENCES [lookup_product_ship_time] (
		[code]
	),
	 FOREIGN KEY 
	(
		[format_id]
	) REFERENCES [lookup_product_format] (
		[code]
	),
	 FOREIGN KEY 
	(
		[large_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[parent_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[shipping_id]
	) REFERENCES [lookup_product_shipping] (
		[code]
	),
	 FOREIGN KEY 
	(
		[small_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[thumbnail_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[type_id]
	) REFERENCES [lookup_product_type] (
		[code]
	)
GO

ALTER TABLE [product_category] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[large_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[parent_id]
	) REFERENCES [product_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[small_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[thumbnail_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[type_id]
	) REFERENCES [lookup_product_category_type] (
		[code]
	)
GO

ALTER TABLE [product_option] ADD 
	 FOREIGN KEY 
	(
		[configurator_id]
	) REFERENCES [product_option_configurator] (
		[configurator_id]
	),
	 FOREIGN KEY 
	(
		[parent_id]
	) REFERENCES [product_option] (
		[option_id]
	)
GO

ALTER TABLE [project_files_download] ADD 
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[user_download_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [project_files_version] ADD 
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [project_issues] ADD 
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[project_id]
	) REFERENCES [projects] (
		[project_id]
	),
	 FOREIGN KEY 
	(
		[type_id]
	) REFERENCES [lookup_project_issues] (
		[code]
	)
GO

ALTER TABLE [project_requirements] ADD 
	 FOREIGN KEY 
	(
		[actual_loetype]
	) REFERENCES [lookup_project_loe] (
		[code]
	),
	 FOREIGN KEY 
	(
		[approvedBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[closedBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[estimated_loetype]
	) REFERENCES [lookup_project_loe] (
		[code]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[project_id]
	) REFERENCES [projects] (
		[project_id]
	)
GO

ALTER TABLE [project_team] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[project_id]
	) REFERENCES [projects] (
		[project_id]
	),
	 FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [report] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [permission_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[permission_id]
	) REFERENCES [permission] (
		[permission_id]
	)
GO

ALTER TABLE [revenue] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[type]
	) REFERENCES [lookup_revenue_types] (
		[code]
	)
GO

ALTER TABLE [role_permission] ADD 
	 FOREIGN KEY 
	(
		[permission_id]
	) REFERENCES [permission] (
		[permission_id]
	),
	 FOREIGN KEY 
	(
		[role_id]
	) REFERENCES [role] (
		[role_id]
	)
GO

ALTER TABLE [saved_criteriaelement] ADD 
	 FOREIGN KEY 
	(
		[field]
	) REFERENCES [search_fields] (
		[id]
	),
	 FOREIGN KEY 
	(
		[operatorid]
	) REFERENCES [field_types] (
		[id]
	),
	 FOREIGN KEY 
	(
		[id]
	) REFERENCES [saved_criterialist] (
		[id]
	)
GO

ALTER TABLE [survey_questions] ADD 
	 FOREIGN KEY 
	(
		[survey_id]
	) REFERENCES [survey] (
		[survey_id]
	),
	 FOREIGN KEY 
	(
		[type]
	) REFERENCES [lookup_survey_types] (
		[code]
	)
GO

ALTER TABLE [sync_conflict_log] ADD 
	 FOREIGN KEY 
	(
		[client_id]
	) REFERENCES [sync_client] (
		[client_id]
	),
	 FOREIGN KEY 
	(
		[table_id]
	) REFERENCES [sync_table] (
		[table_id]
	)
GO

ALTER TABLE [sync_map] ADD 
	 FOREIGN KEY 
	(
		[client_id]
	) REFERENCES [sync_client] (
		[client_id]
	),
	 FOREIGN KEY 
	(
		[table_id]
	) REFERENCES [sync_table] (
		[table_id]
	)
GO

ALTER TABLE [sync_transaction_log] ADD 
	 FOREIGN KEY 
	(
		[log_id]
	) REFERENCES [sync_log] (
		[log_id]
	)
GO

ALTER TABLE [taskcategory_project] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [lookup_task_category] (
		[code]
	),
	 FOREIGN KEY 
	(
		[project_id]
	) REFERENCES [projects] (
		[project_id]
	)
GO

ALTER TABLE [tasklink_project] ADD 
	 FOREIGN KEY 
	(
		[project_id]
	) REFERENCES [projects] (
		[project_id]
	),
	 FOREIGN KEY 
	(
		[task_id]
	) REFERENCES [task] (
		[task_id]
	)
GO

ALTER TABLE [viewpoint_permission] ADD 
	 FOREIGN KEY 
	(
		[permission_id]
	) REFERENCES [permission] (
		[permission_id]
	),
	 FOREIGN KEY 
	(
		[viewpoint_id]
	) REFERENCES [viewpoint] (
		[viewpoint_id]
	)
GO

ALTER TABLE [action_item_log] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [action_item] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [active_survey_questions] ADD 
	 FOREIGN KEY 
	(
		[active_survey_id]
	) REFERENCES [active_survey] (
		[active_survey_id]
	),
	 FOREIGN KEY 
	(
		[type]
	) REFERENCES [lookup_survey_types] (
		[code]
	)
GO

ALTER TABLE [active_survey_responses] ADD 
	 FOREIGN KEY 
	(
		[active_survey_id]
	) REFERENCES [active_survey] (
		[active_survey_id]
	)
GO

ALTER TABLE [autoguide_inventory] ADD 
	 FOREIGN KEY 
	(
		[account_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[vehicle_id]
	) REFERENCES [autoguide_vehicle] (
		[vehicle_id]
	)
GO

ALTER TABLE [business_process_component_parameter] ADD 
	 FOREIGN KEY 
	(
		[component_id]
	) REFERENCES [business_process_component] (
		[id]
	),
	 FOREIGN KEY 
	(
		[parameter_id]
	) REFERENCES [business_process_parameter_library] (
		[parameter_id]
	)
GO

ALTER TABLE [business_process_hook] ADD 
	 FOREIGN KEY 
	(
		[process_id]
	) REFERENCES [business_process] (
		[process_id]
	),
	 FOREIGN KEY 
	(
		[trigger_id]
	) REFERENCES [business_process_hook_triggers] (
		[trigger_id]
	)
GO

ALTER TABLE [cfsinbox_messagelink] ADD 
	 FOREIGN KEY 
	(
		[sent_to]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[sent_from]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[id]
	) REFERENCES [cfsinbox_message] (
		[id]
	)
GO

ALTER TABLE [contact_address] ADD 
	 FOREIGN KEY 
	(
		[address_type]
	) REFERENCES [lookup_contactaddress_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [contact_emailaddress] ADD 
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[emailaddress_type]
	) REFERENCES [lookup_contactemail_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [contact_phone] ADD 
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[phone_type]
	) REFERENCES [lookup_contactphone_types] (
		[code]
	)
GO

ALTER TABLE [contact_type_levels] ADD 
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[type_id]
	) REFERENCES [lookup_contact_types] (
		[code]
	)
GO

ALTER TABLE [custom_field_group] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [custom_field_category] (
		[category_id]
	)
GO

ALTER TABLE [custom_field_record] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [custom_field_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [excluded_recipient] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	)
GO

ALTER TABLE [help_business_rules] ADD 
	 FOREIGN KEY 
	(
		[completedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_help_id]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [help_features] ADD 
	 FOREIGN KEY 
	(
		[completedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_help_id]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[link_feature_id]
	) REFERENCES [lookup_help_features] (
		[code]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [help_notes] ADD 
	 FOREIGN KEY 
	(
		[completedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_help_id]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [help_related_links] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[linkto_content_id]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owning_module_id]
	) REFERENCES [help_module] (
		[module_id]
	)
GO

ALTER TABLE [help_tableofcontentitem_links] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[global_link_id]
	) REFERENCES [help_tableof_contents] (
		[content_id]
	),
	 FOREIGN KEY 
	(
		[linkto_content_id]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [help_tips] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_help_id]
	) REFERENCES [help_contents] (
		[help_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [opportunity_header] ADD 
	 FOREIGN KEY 
	(
		[acctlink]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[contactlink]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [package] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [product_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[large_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[small_image_id]
	) REFERENCES [project_files] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[thumbnail_image_id]
	) REFERENCES [project_files] (
		[item_id]
	)
GO

ALTER TABLE [product_catalog_category_map] ADD 
	 FOREIGN KEY 
	(
		[category_id]
	) REFERENCES [product_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	)
GO

ALTER TABLE [product_catalog_pricing] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[msrp_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[recurring_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_type]
	) REFERENCES [lookup_recurring_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[tax_id]
	) REFERENCES [lookup_product_tax] (
		[code]
	)
GO

ALTER TABLE [product_category_map] ADD 
	 FOREIGN KEY 
	(
		[category1_id]
	) REFERENCES [product_category] (
		[category_id]
	),
	 FOREIGN KEY 
	(
		[category2_id]
	) REFERENCES [product_category] (
		[category_id]
	)
GO

ALTER TABLE [product_keyword_map] ADD 
	 FOREIGN KEY 
	(
		[keyword_id]
	) REFERENCES [lookup_product_keyword] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	)
GO

ALTER TABLE [product_option_boolean] ADD 
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option] (
		[option_id]
	)
GO

ALTER TABLE [product_option_float] ADD 
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option] (
		[option_id]
	)
GO

ALTER TABLE [product_option_integer] ADD 
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option] (
		[option_id]
	)
GO

ALTER TABLE [product_option_text] ADD 
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option] (
		[option_id]
	)
GO

ALTER TABLE [product_option_timestamp] ADD 
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option] (
		[option_id]
	)
GO

ALTER TABLE [product_option_values] ADD 
	 FOREIGN KEY 
	(
		[msrp_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[option_id]
	) REFERENCES [product_option] (
		[option_id]
	),
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_type]
	) REFERENCES [lookup_recurring_type] (
		[code]
	)
GO

ALTER TABLE [project_assignments] ADD 
	 FOREIGN KEY 
	(
		[activity_id]
	) REFERENCES [lookup_project_activity] (
		[code]
	),
	 FOREIGN KEY 
	(
		[actual_loetype]
	) REFERENCES [lookup_project_loe] (
		[code]
	),
	 FOREIGN KEY 
	(
		[assignedBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[estimated_loetype]
	) REFERENCES [lookup_project_loe] (
		[code]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[priority_id]
	) REFERENCES [lookup_project_priority] (
		[code]
	),
	 FOREIGN KEY 
	(
		[project_id]
	) REFERENCES [projects] (
		[project_id]
	),
	 FOREIGN KEY 
	(
		[requirement_id]
	) REFERENCES [project_requirements] (
		[requirement_id]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_project_status] (
		[code]
	),
	 FOREIGN KEY 
	(
		[user_assign_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [project_issue_replies] ADD 
	 FOREIGN KEY 
	(
		[enteredBy]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[issue_id]
	) REFERENCES [project_issues] (
		[issue_id]
	),
	 FOREIGN KEY 
	(
		[modifiedBy]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [report_criteria] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[report_id]
	) REFERENCES [report] (
		[report_id]
	)
GO

ALTER TABLE [report_queue] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[report_id]
	) REFERENCES [report] (
		[report_id]
	)
GO

ALTER TABLE [revenue_detail] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[revenue_id]
	) REFERENCES [revenue] (
		[id]
	),
	 FOREIGN KEY 
	(
		[type]
	) REFERENCES [lookup_revenue_types] (
		[code]
	)
GO

ALTER TABLE [scheduled_recipient] ADD 
	 FOREIGN KEY 
	(
		[campaign_id]
	) REFERENCES [campaign] (
		[campaign_id]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	)
GO

ALTER TABLE [service_contract] ADD 
	 FOREIGN KEY 
	(
		[account_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[category]
	) REFERENCES [lookup_sc_category] (
		[code]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[email_service_model]
	) REFERENCES [lookup_email_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[onsite_service_model]
	) REFERENCES [lookup_onsite_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[response_time]
	) REFERENCES [lookup_response_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[telephone_service_model]
	) REFERENCES [lookup_phone_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[type]
	) REFERENCES [lookup_sc_type] (
		[code]
	)
GO

ALTER TABLE [survey_items] ADD 
	 FOREIGN KEY 
	(
		[question_id]
	) REFERENCES [survey_questions] (
		[question_id]
	)
GO

ALTER TABLE [tasklink_contact] ADD 
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[task_id]
	) REFERENCES [task] (
		[task_id]
	)
GO

ALTER TABLE [active_survey_answers] ADD 
	 FOREIGN KEY 
	(
		[question_id]
	) REFERENCES [active_survey_questions] (
		[question_id]
	),
	 FOREIGN KEY 
	(
		[response_id]
	) REFERENCES [active_survey_responses] (
		[response_id]
	)
GO

ALTER TABLE [active_survey_items] ADD 
	 FOREIGN KEY 
	(
		[question_id]
	) REFERENCES [active_survey_questions] (
		[question_id]
	)
GO

ALTER TABLE [asset] ADD 
	 FOREIGN KEY 
	(
		[account_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[contract_id]
	) REFERENCES [service_contract] (
		[contract_id]
	),
	 FOREIGN KEY 
	(
		[email_service_model]
	) REFERENCES [lookup_email_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[level1]
	) REFERENCES [asset_category] (
		[id]
	),
	 FOREIGN KEY 
	(
		[level2]
	) REFERENCES [asset_category] (
		[id]
	),
	 FOREIGN KEY 
	(
		[level3]
	) REFERENCES [asset_category] (
		[id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[onsite_service_model]
	) REFERENCES [lookup_onsite_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[response_time]
	) REFERENCES [lookup_response_model] (
		[code]
	),
	 FOREIGN KEY 
	(
		[telephone_service_model]
	) REFERENCES [lookup_phone_model] (
		[code]
	)
GO

ALTER TABLE [autoguide_ad_run] ADD 
	 FOREIGN KEY 
	(
		[inventory_id]
	) REFERENCES [autoguide_inventory] (
		[inventory_id]
	)
GO

ALTER TABLE [autoguide_inventory_options] ADD 
	 FOREIGN KEY 
	(
		[inventory_id]
	) REFERENCES [autoguide_inventory] (
		[inventory_id]
	)
GO

ALTER TABLE [call_log] ADD 
	 FOREIGN KEY 
	(
		[call_type_id]
	) REFERENCES [lookup_call_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[opp_id]
	) REFERENCES [opportunity_header] (
		[opp_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	)
GO

ALTER TABLE [custom_field_info] ADD 
	 FOREIGN KEY 
	(
		[group_id]
	) REFERENCES [custom_field_group] (
		[group_id]
	)
GO

ALTER TABLE [opportunity_component] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[opp_id]
	) REFERENCES [opportunity_header] (
		[opp_id]
	),
	 FOREIGN KEY 
	(
		[owner]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[stage]
	) REFERENCES [lookup_stage] (
		[code]
	)
GO

ALTER TABLE [package_products_map] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[msrp_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[package_id]
	) REFERENCES [package] (
		[package_id]
	),
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	)
GO

ALTER TABLE [product_option_map] ADD 
	 FOREIGN KEY 
	(
		[option_id]
	) REFERENCES [product_option] (
		[option_id]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[value_id]
	) REFERENCES [product_option_values] (
		[value_id]
	)
GO

ALTER TABLE [project_assignments_status] ADD 
	 FOREIGN KEY 
	(
		[assignment_id]
	) REFERENCES [project_assignments] (
		[assignment_id]
	),
	 FOREIGN KEY 
	(
		[user_id]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [report_criteria_parameter] ADD 
	 FOREIGN KEY 
	(
		[criteria_id]
	) REFERENCES [report_criteria] (
		[criteria_id]
	)
GO

ALTER TABLE [report_queue_criteria] ADD 
	 FOREIGN KEY 
	(
		[queue_id]
	) REFERENCES [report_queue] (
		[queue_id]
	)
GO

ALTER TABLE [service_contract_hours] ADD 
	 FOREIGN KEY 
	(
		[adjustment_reason]
	) REFERENCES [lookup_hours_reason] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_contract_id]
	) REFERENCES [service_contract] (
		[contract_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [service_contract_products] ADD 
	 FOREIGN KEY 
	(
		[link_contract_id]
	) REFERENCES [service_contract] (
		[contract_id]
	),
	 FOREIGN KEY 
	(
		[link_product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	)
GO

ALTER TABLE [active_survey_answer_avg] ADD 
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [active_survey_items] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[question_id]
	) REFERENCES [active_survey_questions] (
		[question_id]
	)
GO

ALTER TABLE [active_survey_answer_items] ADD 
	 FOREIGN KEY 
	(
		[answer_id]
	) REFERENCES [active_survey_answers] (
		[answer_id]
	),
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [active_survey_items] (
		[item_id]
	)
GO

ALTER TABLE [custom_field_data] ADD 
	 FOREIGN KEY 
	(
		[field_id]
	) REFERENCES [custom_field_info] (
		[field_id]
	),
	 FOREIGN KEY 
	(
		[record_id]
	) REFERENCES [custom_field_record] (
		[record_id]
	)
GO

ALTER TABLE [custom_field_lookup] ADD 
	 FOREIGN KEY 
	(
		[field_id]
	) REFERENCES [custom_field_info] (
		[field_id]
	)
GO

ALTER TABLE [opportunity_component_levels] ADD 
	 FOREIGN KEY 
	(
		[opp_id]
	) REFERENCES [opportunity_component] (
		[id]
	),
	 FOREIGN KEY 
	(
		[type_id]
	) REFERENCES [lookup_opportunity_types] (
		[code]
	)
GO

ALTER TABLE [customer_product] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[order_id]
	) REFERENCES [order_entry] (
		[order_id]
	),
	 FOREIGN KEY 
	(
		[order_item_id]
	) REFERENCES [order_product] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_order_status] (
		[code]
	)
GO

ALTER TABLE [customer_product_history] ADD 
	 FOREIGN KEY 
	(
		[customer_product_id]
	) REFERENCES [customer_product] (
		[customer_product_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[order_id]
	) REFERENCES [order_entry] (
		[order_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	)
GO

ALTER TABLE [order_address] ADD 
	 FOREIGN KEY 
	(
		[address_type]
	) REFERENCES [lookup_orderaddress_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[order_id]
	) REFERENCES [order_entry] (
		[order_id]
	)
GO

ALTER TABLE [order_entry] ADD 
	 FOREIGN KEY 
	(
		[billing_contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[orderedby]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[order_terms_id]
	) REFERENCES [lookup_order_terms] (
		[code]
	),
	 FOREIGN KEY 
	(
		[order_type_id]
	) REFERENCES [lookup_order_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[parent_id]
	) REFERENCES [order_entry] (
		[order_id]
	),
	 FOREIGN KEY 
	(
		[quote_id]
	) REFERENCES [quote_entry] (
		[quote_id]
	),
	 FOREIGN KEY 
	(
		[sales_id]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[source_id]
	) REFERENCES [lookup_order_source] (
		[code]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_order_status] (
		[code]
	)
GO

ALTER TABLE [order_payment] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[order_id]
	) REFERENCES [order_entry] (
		[order_id]
	),
	 FOREIGN KEY 
	(
		[payment_method_id]
	) REFERENCES [lookup_payment_methods] (
		[code]
	)
GO

ALTER TABLE [order_product] ADD 
	 FOREIGN KEY 
	(
		[msrp_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[order_id]
	) REFERENCES [order_entry] (
		[order_id]
	),
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[recurring_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_type]
	) REFERENCES [lookup_recurring_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_order_status] (
		[code]
	)
GO

ALTER TABLE [order_product_option_boolean] ADD 
	 FOREIGN KEY 
	(
		[order_product_option_id]
	) REFERENCES [order_product_options] (
		[order_product_option_id]
	)
GO

ALTER TABLE [order_product_option_float] ADD 
	 FOREIGN KEY 
	(
		[order_product_option_id]
	) REFERENCES [order_product_options] (
		[order_product_option_id]
	)
GO

ALTER TABLE [order_product_option_integer] ADD 
	 FOREIGN KEY 
	(
		[order_product_option_id]
	) REFERENCES [order_product_options] (
		[order_product_option_id]
	)
GO

ALTER TABLE [order_product_option_text] ADD 
	 FOREIGN KEY 
	(
		[order_product_option_id]
	) REFERENCES [order_product_options] (
		[order_product_option_id]
	)
GO

ALTER TABLE [order_product_option_timestamp] ADD 
	 FOREIGN KEY 
	(
		[order_product_option_id]
	) REFERENCES [order_product_options] (
		[order_product_option_id]
	)
GO

ALTER TABLE [order_product_options] ADD 
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [order_product] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option_map] (
		[product_option_id]
	),
	 FOREIGN KEY 
	(
		[recurring_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_type]
	) REFERENCES [lookup_recurring_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_order_status] (
		[code]
	)
GO

ALTER TABLE [order_product_status] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [order_product] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[order_id]
	) REFERENCES [order_entry] (
		[order_id]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_order_status] (
		[code]
	)
GO

ALTER TABLE [payment_creditcard] ADD 
	 FOREIGN KEY 
	(
		[card_type]
	) REFERENCES [lookup_creditcard_types] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[payment_id]
	) REFERENCES [order_payment] (
		[payment_id]
	)
GO

ALTER TABLE [payment_eft] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[payment_id]
	) REFERENCES [order_payment] (
		[payment_id]
	)
GO

ALTER TABLE [quote_entry] ADD 
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[customer_product_id]
	) REFERENCES [customer_product] (
		[customer_product_id]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[parent_id]
	) REFERENCES [quote_entry] (
		[quote_id]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[quote_terms_id]
	) REFERENCES [lookup_quote_terms] (
		[code]
	),
	 FOREIGN KEY 
	(
		[quote_type_id]
	) REFERENCES [lookup_quote_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[source_id]
	) REFERENCES [lookup_quote_source] (
		[code]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_quote_status] (
		[code]
	),
	 FOREIGN KEY 
	(
		[ticketid]
	) REFERENCES [ticket] (
		[ticketid]
	)
GO

ALTER TABLE [quote_notes] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[quote_id]
	) REFERENCES [quote_entry] (
		[quote_id]
	)
GO

ALTER TABLE [quote_product] ADD 
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[quote_id]
	) REFERENCES [quote_entry] (
		[quote_id]
	),
	 FOREIGN KEY 
	(
		[recurring_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_type]
	) REFERENCES [lookup_recurring_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_quote_status] (
		[code]
	)
GO

ALTER TABLE [quote_product_option_boolean] ADD 
	 FOREIGN KEY 
	(
		[quote_product_option_id]
	) REFERENCES [quote_product_options] (
		[quote_product_option_id]
	)
GO

ALTER TABLE [quote_product_option_float] ADD 
	 FOREIGN KEY 
	(
		[quote_product_option_id]
	) REFERENCES [quote_product_options] (
		[quote_product_option_id]
	)
GO

ALTER TABLE [quote_product_option_integer] ADD 
	 FOREIGN KEY 
	(
		[quote_product_option_id]
	) REFERENCES [quote_product_options] (
		[quote_product_option_id]
	)
GO

ALTER TABLE [quote_product_option_text] ADD 
	 FOREIGN KEY 
	(
		[quote_product_option_id]
	) REFERENCES [quote_product_options] (
		[quote_product_option_id]
	)
GO

ALTER TABLE [quote_product_option_timestamp] ADD 
	 FOREIGN KEY 
	(
		[quote_product_option_id]
	) REFERENCES [quote_product_options] (
		[quote_product_option_id]
	)
GO

ALTER TABLE [quote_product_options] ADD 
	 FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [quote_product] (
		[item_id]
	),
	 FOREIGN KEY 
	(
		[price_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_option_id]
	) REFERENCES [product_option_map] (
		[product_option_id]
	),
	 FOREIGN KEY 
	(
		[recurring_currency]
	) REFERENCES [lookup_currency] (
		[code]
	),
	 FOREIGN KEY 
	(
		[recurring_type]
	) REFERENCES [lookup_recurring_type] (
		[code]
	),
	 FOREIGN KEY 
	(
		[status_id]
	) REFERENCES [lookup_quote_status] (
		[code]
	)
GO

ALTER TABLE [tasklink_ticket] ADD 
	 FOREIGN KEY 
	(
		[task_id]
	) REFERENCES [task] (
		[task_id]
	),
	 FOREIGN KEY 
	(
		[ticket_id]
	) REFERENCES [ticket] (
		[ticketid]
	)
GO

ALTER TABLE [ticket] ADD 
	 FOREIGN KEY 
	(
		[assigned_to]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[cat_code]
	) REFERENCES [ticket_category] (
		[id]
	),
	 FOREIGN KEY 
	(
		[contact_id]
	) REFERENCES [contact] (
		[contact_id]
	),
	 FOREIGN KEY 
	(
		[customer_product_id]
	) REFERENCES [customer_product] (
		[customer_product_id]
	),
	 FOREIGN KEY 
	(
		[department_code]
	) REFERENCES [lookup_department] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[level_code]
	) REFERENCES [ticket_level] (
		[code]
	),
	 FOREIGN KEY 
	(
		[link_asset_id]
	) REFERENCES [asset] (
		[asset_id]
	),
	 FOREIGN KEY 
	(
		[link_contract_id]
	) REFERENCES [service_contract] (
		[contract_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[org_id]
	) REFERENCES [organization] (
		[org_id]
	),
	 FOREIGN KEY 
	(
		[pri_code]
	) REFERENCES [ticket_priority] (
		[code]
	),
	 FOREIGN KEY 
	(
		[product_id]
	) REFERENCES [product_catalog] (
		[product_id]
	),
	 FOREIGN KEY 
	(
		[scode]
	) REFERENCES [ticket_severity] (
		[code]
	),
	 FOREIGN KEY 
	(
		[source_code]
	) REFERENCES [lookup_ticketsource] (
		[code]
	),
	 FOREIGN KEY 
	(
		[subcat_code1]
	) REFERENCES [ticket_category] (
		[id]
	),
	 FOREIGN KEY 
	(
		[subcat_code2]
	) REFERENCES [ticket_category] (
		[id]
	),
	 FOREIGN KEY 
	(
		[subcat_code3]
	) REFERENCES [ticket_category] (
		[id]
	)
GO

ALTER TABLE [ticket_activity_item] ADD 
	 FOREIGN KEY 
	(
		[link_form_id]
	) REFERENCES [ticket_csstm_form] (
		[form_id]
	)
GO

ALTER TABLE [ticket_csstm_form] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_ticket_id]
	) REFERENCES [ticket] (
		[ticketid]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [ticket_sun_form] ADD 
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[link_ticket_id]
	) REFERENCES [ticket] (
		[ticketid]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	)
GO

ALTER TABLE [ticketlog] ADD 
	 FOREIGN KEY 
	(
		[assigned_to]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[department_code]
	) REFERENCES [lookup_department] (
		[code]
	),
	 FOREIGN KEY 
	(
		[enteredby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[modifiedby]
	) REFERENCES [access] (
		[user_id]
	),
	 FOREIGN KEY 
	(
		[pri_code]
	) REFERENCES [ticket_priority] (
		[code]
	),
	 FOREIGN KEY 
	(
		[scode]
	) REFERENCES [ticket_severity] (
		[code]
	),
	 FOREIGN KEY 
	(
		[ticketid]
	) REFERENCES [ticket] (
		[ticketid]
	)
GO

ALTER TABLE [trouble_asset_replacement] ADD 
	 FOREIGN KEY 
	(
		[link_form_id]
	) REFERENCES [ticket_sun_form] (
		[form_id]
	)
GO

