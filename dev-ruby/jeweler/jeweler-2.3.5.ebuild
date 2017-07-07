# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple and opinionated helper for creating Rubygem projects on GitHub"
HOMEPAGE="http://github.com/technicalpickles/jeweler"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/git-1.2.5"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.10"
ruby_add_rdepend ">=dev-ruby/github_api-0.11.0"
ruby_add_rdepend ">=dev-ruby/highline-1.6.15"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend ">=dev-ruby/semver2-0"
ruby_add_rdepend ">=dev-ruby/psych-2.2"
ruby_add_rdepend ">=dev-ruby/yard-0.8.5"
ruby_add_rdepend ">=dev-ruby/bluecloth-0"
ruby_add_rdepend ">=dev-ruby/cucumber-1.1.4"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

