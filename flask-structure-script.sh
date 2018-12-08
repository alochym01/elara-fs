#!/usr/bin/env bash
mkdir -p {utils,app/{static/{css,images,js},templates/{callcenter,cdr,dashboard,errors,sip_accounts,sip_trunks},views,models,forms},instance}
touch app/{__init__.py,models/{__init__.py,callcenter_model.py,cdr_model.py,sip_account_model.py,sip_trunk_model.py}}
touch app/templates/{base.html,macro.html,macro.html}
touch app/views/{__init__.py,callcenter.py,cdr.py,dashboard.py,sip_accounts.py,sip_trunks.py,errors.py}
touch app/forms/{user.py,}
touch utils/{helpers.py,}
touch instance/{config.py,}
touch {requirement.txt,run.py,config.py}