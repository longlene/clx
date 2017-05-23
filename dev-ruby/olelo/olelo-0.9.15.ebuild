# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Olelo is a git-based wiki which supports many markup languages, tags, embedded TeX and much more"
HOMEPAGE="http://gitwiki.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redcloth-4.2.9"
ruby_add_rdepend ">=dev-ruby/creole-0.5.0"
ruby_add_rdepend ">=dev-ruby/evaluator-0.1.6"
ruby_add_rdepend ">=dev-ruby/mimemagic-0.2.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.7.3"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.0"
ruby_add_rdepend ">=dev-ruby/rack-1.5.0"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.0.0"
ruby_add_rdepend ">=dev-ruby/rugged-0.19.0"
ruby_add_rdepend ">=dev-ruby/slim-2.0.0"
ruby_add_rdepend ">=dev-ruby/psych-2.0.0"
ruby_add_rdepend ">=dev-ruby/moneta-0.7.0"
ruby_add_rdepend ">=dev-ruby/rouge-0.3.6"
ruby_add_rdepend ">=dev-ruby/rack-protection-1.5.0"
ruby_add_rdepend ">=dev-ruby/bacon-1.1.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.2"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/sass-3.2.3"

