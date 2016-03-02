# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Reek is a tool that examines Ruby classes, modules and methods and reports
    any code smells it finds"
HOMEPAGE="https://github.com/troessner/reek/wiki"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/codeclimate-engine-rb-0.3.1"
ruby_add_rdepend ">=dev-ruby/parser-2.3"
ruby_add_rdepend ">=dev-ruby/private_attr-1.1"
ruby_add_rdepend ">=dev-ruby/rainbow-2.0"

