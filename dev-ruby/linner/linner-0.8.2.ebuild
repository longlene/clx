# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="HTML5 Application Assembler"
HOMEPAGE="https://github.com/saitowu/linner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.18"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"
ruby_add_rdepend ">=dev-ruby/reel-0.5.0"
ruby_add_rdepend ">=dev-ruby/listen-1.3"
ruby_add_rdepend ">=dev-ruby/uglifier-2.5.0"
ruby_add_rdepend ">=dev-ruby/cssminify-1.0.2"
ruby_add_rdepend ">=dev-ruby/chunky_png-1.3.1"
ruby_add_rdepend ">=dev-ruby/compass-core-1.0.1"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.3.0"
ruby_add_rdepend ">=dev-ruby/handlebars_rb-0.1.2"
ruby_add_rdepend ">=dev-ruby/terminal-notifier-1.5"

