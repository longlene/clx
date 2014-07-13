# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="An IRB alternative and runtime developer console"
HOMEPAGE="http://pryrepl.org"

LICENSE="MIT"
SLOT="ruby19"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/coderay-1.1.0"
ruby_add_rdepend ">=dev-ruby/method_source-0.8.1"
ruby_add_rdepend ">=dev-ruby/slop-3.4"
#ruby_add_rdepend "!<=dev-ruby/pry-0.9.12.4"


#all_ruby_perpare() {
#	sed -i -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die
#}

