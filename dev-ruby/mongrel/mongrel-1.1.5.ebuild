# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A small fast HTTP library and server that runs Rails, Camping, Nitro and Iowa apps"
HOMEPAGE="http://mongrel.rubyforge.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gem_plugin-0.2.3"
ruby_add_rdepend ">=dev-ruby/daemons-1.0.3"
ruby_add_rdepend ">=dev-ruby/fastthread-1.0.1"
ruby_add_rdepend ">=dev-ruby/cgi_multipart_eof_fix-2.4"

