# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A nice web site generator"
HOMEPAGE="https://github.com/eunomie/wst"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/sass-3.4"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.3"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.2"
ruby_add_rdepend ">=dev-ruby/pygments_rb-0.6"
ruby_add_rdepend ">=dev-ruby/html_truncator-0.2"
ruby_add_rdepend ">=dev-ruby/uglifier-2.4"
ruby_add_rdepend ">=dev-ruby/serve-1.5"

