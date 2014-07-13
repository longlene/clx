# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Rubyesque interface to Gmail, with all the tools you will need. Search, read and send multipart emails; archive, mark as read/unread, delete emails; and manage labels."
HOMEPAGE="http://github.com/nu7hatch/gmail"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gmail_xoauth-0.3.0"
ruby_add_rdepend ">=dev-ruby/mail-2.2.1"
ruby_add_rdepend ">=dev-ruby/mime-0.1"

