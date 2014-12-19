# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Produces UNIX manual pages for executable scripts"
HOMEPAGE="http://github.com/sunaku/binman"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/md2man-4.0"
ruby_add_rdepend ">=dev-ruby/opener-0.1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.1"

